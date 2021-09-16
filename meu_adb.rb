#!/usr/bin/ruby

require "yaml/store"
require 'fileutils'

system("cls")
system("clear")

Prm = Struct.new :time_sync
Mnt = Struct.new :path, :user ,:pwd, :dom, :status
Dev = Struct.new :index, :id, :status
Apk = Struct.new :index, :fname, :path, :mtime, :size



=begin

__END__

require "benchmark"
test = "hi man"
m = test.method(:length)
n = 100000
Benchmark.bmbm {|x|
  x.report("call") { n.times { m.call } }
  x.report("send") { n.times { test.send(:length) } }
  x.report("eval") { n.times { eval "test.length" } }
}



tty_param = `stty -g`
system "stty raw"

a = IO.read "/dev/stdin", 1

system "stty #{tty_param}"

print a

=end



class MeuAdb
  def initialize
    puts "-----------------------"
    puts "  Iniciando o sistema  "
    puts "-----------------------\n\n"

    # verifica se adb está installdo
    # if system("adb --help > meu_adb.txt")
    #   puts "instale o adb. #{$?}"
    #   return
    # end

    # load dos parâmetros
    load   = YAML.load_file("meu_adb.yml")
    @prm   = load["prm"]
    @mnt   = load["mnt"]
    @devs  = load["devs"]
    @apks  = load["apks"]

    # variáveis diversas
    @devs  = []
    @mutex = Mutex.new

    # monta compartilhamento por padrão
    mount

    # procura arquivos por padrão
    search

    # procura dispositivos por padrão
    dev_add

    if @apks.count > 0
      puts "(\"start\" para iniciar...)\n\n"
    else
      puts "(corrigir erros...)\n\n"
    end

    # habilita comandos
    command
  end

  def command
    while true
      cmd = gets
      cmd.strip!

      opt = cmd.split("(")[0]

      if cmd == "start"
        puts "monitoramento iniciado.\n\n"
        @start = true
        interact
      elsif cmd == "pause";   @start = false; puts ""
      elsif cmd == "save";    save

      elsif cmd == "apks";    apk_pri
      elsif cmd == "paths";   pth_pri
      elsif cmd == "mounts";  mnt_pri
      elsif cmd == "devs";    dev_pri

      elsif cmd == "mount";   mount
      elsif cmd == "umount";  umount
      elsif cmd == "dev_add"; dev_add


      elsif opt == "dev_ena"; eval(cmd)
      elsif opt == "dev_dis"; eval(cmd)
      elsif opt == "apk_add"; eval(cmd)
      elsif opt == "apk_del"; eval(cmd)
      elsif opt == "install"; eval(cmd)

      elsif cmd == "help";    help
      elsif cmd == "quit";    umount; break
      else; puts "comando \"#{cmd}\" não encontrado."
      end
    end
  end

  ## executa monitoramento em background
  def interact
    Thread.new do
      @mutex.synchronize do
        watch
        sleep(@prm.time_sync)
      end

      if @start
        interact
      else
        puts "\nmonitoramento pausado.\n"
      end
    end
  end

  ## auxiliar do interact que verifica se os arquivos foram motificados ou excluidos
  def watch
    @apks.each do |apk|
      file = apk.path
      if File.exist?(file)
        if apk.mtime != File.mtime(file) || apk.size != File.size(file)
          puts "arquivo \"#{apk.fname}\" modificado."
          cp_install(file)
          @apks.delete_at(apk.index - 1)
          verify(file)
        end
      else
        puts "arquivo \"#{apk.fname}\" não encontrado"
      end
    end
  end

  ## alimenta array apks com arquivos encontrados
  def search
    puts "procurando arquivos...\n"

    paths = []
    @apks.each do |apk|
      paths << apk.path
    end
    @apks.clear

    paths.each do |path|
      verify(path)
    end

    @apks.compact!
    apk_pri
  end

  ## auxiliar do search que verifica arquivos que correspondem aos parâmetros de monitoramento
  def verify(file)
    if File.exist?(file)
      apk = Apk.new
      apk.index = @apks.count + 1
      apk.fname = File.basename(file)
      apk.path  = File.absolute_path(file)
      apk.mtime = File.mtime(file)
      apk.size  = File.size(file)
      @apks << apk
    else
      puts file + " não existe!!!"
    end
  end

  ## salva parametros
  def save
    store = YAML::Store.new "meu_adb.yml"
    store.transaction do
      store["prm"]  = @prm
      store["mnt"]  = @mnt
      store["devs"] = @devs
      store["apks"] = @apks
    end
    puts "arquivo de parametos \"meu_adb.yml\" salvo."
  end

  ## força instalação do apk através do índice
  def install(index)
    path = @apks[index - 1].path
    # FileUtils.cp(path, ".")
    cmd = "adb install \"#{path}\""
    system(cmd)
    if $?.exitstatus != 0
      puts "não foi possível instlar o apk (#{path}). #{$?}"
    end
  end

  ## instala os apks que foram atualizados
  def cp_install(path)
    # FileUtils.cp(path, ".")
    cmd = "adb install \"#{path}\""
    system(cmd)
    if $?.exitstatus != 0
      puts "não foi possível instlar o apk (#{path}). #{$?}"
    end
  end

  ## desmontar compartilhamentos
  def umount
    @start = false
    t = @prm.time_sync * 3 + 4
    t.times { sleep(0.3); print "." }
    puts ""

    cmd = "sudo umount ./mount"
    system(cmd)
    if $?.exitstatus != 0
      puts "não foi possível desmontar o compartilhamento #{$?}"
    end

    cmd = "rmdir mount"
    system(cmd)
    if $?.exitstatus == 0
      @mnt.status = "inativo"
      puts "compartilhamento desmontado."
    else
      @mnt.status = "ativo"
      puts "não foi possível excluir a pasta do compartilhamento #{$?}"
    end
    puts "\n"
  end

  ## montar compartilhamentos
  def mount
    cmd = "mkdir mount"
    system(cmd)

    cmd = "sudo mount -t cifs " +
          @mnt.path + " ./mount" +
          " -o username=" + @mnt.user +
          ",password=" + @mnt.pwd +
          ",dominio=" + @mnt.dom
    system(cmd)
    if $?.exitstatus == 0
      puts "compartilhamento montado.\n\n"
      @mnt.status = "ativo"
    else
      @mnt.status = "inativo"
      puts "erro: não foi possível montar o compartilhamento #{$?}\n\n"
    end
  end

  ## procura dispositivos android
  def dev_add
    puts "procurando dispositivos...\n"
    file = "meu_adb.txt"
    system("adb devices > #{file}")
    devs = []
    @devs.each { |e| devs << e.id }

    if $?.exitstatus == 0 && File.exist?(file)
      File.open(file, "r") do |f|
        f.each_line do |line|
          line.strip!
          if line != "List of devices attached" && !line.empty?
            if line.split(" ")[1] != "unauthorized"
              dev = Dev.new
              dev.index  = @devs.count + 1
              dev.id     = line.split(" ")[0]
              dev.status = true
              if !devs.include? dev.id
                @devs << dev
              end
            end
          end
        end
      end
    end

    @devs.compact!
    dev_pri
  end

  ## imprime arquivos do monitoramento
  def mnt_pri
    puts "Mounts:"
    puts @mnt.user + "\t" +
         ("*" * @mnt.pwd.length) + "\t" +
         @mnt.dom + "\t" +
         @mnt.status + "\t" +
         @mnt.path
  end

  ## tenta adicionar novo arquivo no monitoramento
  def apk_add(file)
    # file.gsub!('"', "")
    puts "adicionando apk #{file}..."
    verify(file)
    search
  end

  ## remove arquivo do monitoramento pelo índ.ce
  def apk_del(index)
    index -= 1
    puts "removendo apk \"#{@apks[index].path}\"..."
    @apks.delete_at(index)
    search
  end

  ## imprime arquivos do monitoramento
  def apk_pri
    puts "Apks:"
    @apks.each do |apk|
      puts apk.index.to_s + "\t" +
           (apk.fname + (" " * 30))[0, 30] + "\t" +
           (@start ? "ativo" : "inativo") + "\t" +
           sprintf("%.2f", apk.size / 1024.0 / 1024.0) + "MB\t" +
           apk.mtime.strftime("%d-%b %H:%M:%S.%L")
    end

    puts "\t#{@apks.count} arquivo(s) encontrado(s).\n\n"
  end

  ## imprime paths dos arquivos do monitoramento
  def pth_pri
    puts "Paths:"
    @apks.each do |apk|
      puts apk.path
    end
    puts "\n"
  end

  ## imprime dispositivos android
  def dev_pri
    puts "Devices:"
    @devs.each do |dev|
      puts dev.index.to_s + "\t" +
           dev.id + "\t" +
           (dev.status ? "ativo" : "inativo")
    end

    puts "\tfoi encontrado #{@devs.count} dispositivo(s).\n\n"
  end

  ## habilita dispositivo android
  def dev_ena(index)
    index -= 1
    @devs[index].status = true
    puts "\thabilitando dispositivo #{@devs[index].id}.\n\n"
  end

  ## desabilita dispositivo android
  def dev_dis(index)
    index -= 1
    @devs[index].status = false
    puts "\tdesabilitando dispositivo #{@devs[index].id}.\n\n"
  end

  ## imprime o help
  def help
    puts "start     inicia o monitoramento."
    puts "pause     pausa o monitoramento."
    puts "save      salva as configurações atuais no arquivo."

    puts "apks      exibe os arquivos apks a serem monitorados."
    puts "paths     exibe as pastas a serem monitoradas."
    puts "mounts    exibe a configuração do compartilhamento."
    puts "devs      exibe dispositivos android."

    puts "mount     monta o compartilhamento."
    puts "umount    desmonta o compartilhamento."
    puts "dev_add   procura e adiciona dispositivos android."

    puts "dev_ena   habilita dispositivo android. formato: dev_ena(index)"
    puts "dev_dis   desabilita dispositivo android. formato: dev_dis(index)"
    puts "apk_add   adiciona arquivo a ser monitorado. formato: apk_add(\"/path/file\")"
    puts "apk_del   remove arquivo a ser monitorado. formato: apk_del(index)"
    puts "install   força instalação do apk através do índice. formato: install(index)"

    puts "help      ajuda."
    puts "quit      desmonta o compartilhamento e sai.\n\n"
  end
end

a = MeuAdb.new

