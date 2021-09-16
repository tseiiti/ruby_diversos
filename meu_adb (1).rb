#!/usr/bin/ruby

system('cls')
system('clear')

### classe auxilar para monitoramento
class Apk
  attr_accessor :fname, :path, :apath, :mtime, :size
end

class MeuAdb

  def initialize
    @paths = [] # paths que serão monitoradas
    @fnams = [] # nomes de arquivos que serão monitorados
    @apks  = [] # variável auxilar para monitoramento

    @paths << 'C:\Users\Seiiti\Google Drive'
    @fnams << 'cartao'

    @mutex = Mutex.new

    puts "procurando arquivos..."
    search
    puts "#{@apks.count} arquivo(s) encontrado(s)."

    puts "start para iniciar..."
    command
  end

  def command
    # 10.times do |t|
    while true
      cmd = gets
      cmd.strip!
      cmd = cmd.split(' "')
      if cmd.count == 1
        cmd = cmd[0].split(' ')
      end

      if cmd[0] == 'start'
        puts "monitoramento iniciado..."
        @start = true
        interact

      elsif cmd[0] == 'pause'
        @start = false

      elsif cmd[0] == 'apks'
        print_apks

      elsif cmd[0] == 'path_add'
        path_add(cmd[1])

      elsif cmd[0] == 'path_remove'
        path_remove(cmd[1])

      elsif cmd[0] == 'paths'
        print_paths

      elsif cmd[0] == 'file_add'
        file_add(cmd[1])

      elsif cmd[0] == 'file_remove'
        file_remove(cmd[1])

      elsif cmd[0] == 'files'
        print_files

      elsif cmd[0] == 'help'
        puts 'start para iniciar o monitoramento.'
        puts 'pause para pausar o monitoramento.'
        puts ''
        puts 'apks exibe os apks.'

        puts 'path_add adiciona pasta a ser monitorada. A pasta deve ser entre aspas'
        puts 'path_remove remove pasta a ser monitorada. A pasta deve ser entre aspas'
        puts 'paths exibe as pastas a serem monitoradas.'
        puts ''

        puts 'file_add adiciona arquivo a ser monitorado.'
        puts 'file_remove remove arquivo a ser monitorado.'
        puts 'files exibe os arquivos a serem monitorados.'
        puts ''

        puts 'quit para sair.'

      elsif cmd[0] == 'quit'
        break

      else
        puts "comando \"#{cmd[0]}\" não encontrado."
      end
    end
  end

  ## Executa monitoramento em background
  def interact
    Thread.new do
      @mutex.synchronize do
        watch
        sleep(1)
      end

      if @start
        interact
      else
        puts 'monitoramento pausado...'
      end
    end
  end

  ## auxiliar do interact que verifica se os arquivos foram motificados ou excluidos
  def watch
    @apks.each do |apk|
      if File.exist?(apk.apath)
        if apk.mtime != File.mtime(apk.apath) || apk.size != File.size(apk.apath)
          puts "arquivo \"#{apk.fname}\" modificado."
          search
        end
      else
        puts "arquivo \"#{apk.fname}\" não encontrado"
      end
    end
  end

  ## alimenta array apks com arquivos encontrados
  def search
    @apks.clear
    @paths.each do |path|
      Dir.foreach(path) do |file|
        @apks << verify(path + '/' + file)
      end
    end
    @apks.compact!
    print_apks
  end

  ## auxiliar do search que verifica arquivos que correspondem aos parâmetros de monitoramento
  def verify(file)
    if File.exist?(file)
      if @fnams.include?(File.basename(file, ".*")) && File.extname(file) == '.apk'
        apk = Apk.new
        apk.fname = File.basename(file)
        apk.path  = File.expand_path(file)
        apk.apath = File.absolute_path(file)
        apk.mtime = File.mtime(file)
        apk.size  = File.size(file)
        return apk
      end
    else
      puts file + ' não existe'
    end
  end

  def print_apks
    @apks.each do |apk|
      puts apk.fname + "\t" + apk.size.to_s + "\t" + apk.mtime.to_s
    end
  end

  def path_add(path)
    path.gsub!('"', '')
    puts "adicionando path \"#{path}\"..."
    @paths << path
    search
  end

  def path_remove(path)
    path.gsub!('"', '')
    puts "removendo path \"#{path}\"..."
    @paths.delete(path)
    search
  end

  def print_paths
    @paths.each do |path|
      puts path
    end
  end

  def file_add(file)
    puts "adicionando arquivo \"#{file}\"..."
    @fnams << file
    search
  end

  def file_remove(file)
    puts "removendo arquivo \"#{file}\"..."
    @fnams.delete(file)
    search
  end

  def print_files
    @fnams.each do |file|
      puts file
    end
  end

end

a = MeuAdb.new

__END__

cmd = gets
cmd.strip!
cmd = cmd.split(' "')
puts cmd[0]
puts cmd[1]
