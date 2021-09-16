#!/usr/bin/ruby

system('cls')
system('clear')

require 'yaml/store'
Apk = Struct.new :index, :fname, :path, :mtime, :size

=begin
    puts @apks.inspect
    puts ''
    apk_pri
    puts ''
=end

class MeuAdb
  def initialize
    puts "\nIniciando o sistema\n"

    # load dos parâmetros
    load = YAML.load_file('meu_adb.yml')
    @apks = load['apks']
    puts @apks.inspect

    @mutex = Mutex.new

    search

    puts "\n(\"start\" para iniciar...)\n\n"
    command
  end

  def command
    while true
      cmd = gets
      cmd.strip!
      cmd = cmd.split(' "')
      if cmd.count == 1
        cmd = cmd[0].split(' ')
      end

      if cmd[0] == 'start'
        puts "monitoramento iniciado...\n"
        @start = true
        interact

      elsif cmd[0] == 'pause'
        @start = false

      elsif cmd[0] == 'save'
        save

      elsif cmd[0] == 'apk_add'
        apk_add(cmd[1])

      elsif cmd[0] == 'apk_del'
        apk_del(cmd[1].to_i)

      elsif cmd[0] == 'apks'
        apk_pri

      elsif cmd[0] == 'paths'
        path_pri

      elsif cmd[0] == 'names'
        name_pri

      elsif cmd[0] == 'help'
        puts "\nstart para iniciar o monitoramento."
        puts "pause para pausar o monitoramento."
        puts ""
        puts "apks exibe os apks."

        puts "path_add adiciona pasta a ser monitorada. A pasta deve ser entre aspas"
        puts "path_remove remove pasta a ser monitorada. A pasta deve ser entre aspas"
        puts "paths exibe as pastas a serem monitoradas."
        puts ""

        puts "file_add adiciona arquivo a ser monitorado."
        puts "file_remove remove arquivo a ser monitorado."
        puts "files exibe os arquivos a serem monitorados."
        puts ""

        puts "quit para sair."

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
        sleep(2)
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
      file = apk.path
      if File.exist?(file)
        if apk.mtime != File.mtime(file) || apk.size != File.size(file)
          puts "arquivo \"#{apk.fname}\" modificado."
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
    puts "\nprocurando arquivos...\n"

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

    puts "\t#{@apks.count} arquivo(s) encontrado(s).\n"
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
      puts file + ' não existe!!!'
    end
  end

  ## salva parametros
  def save
    store = YAML::Store.new 'meu_adb.yml'
    store.transaction do
      store["apks"] = @apks
    end
    puts 'arquivo de parametos "meu_adb.yml" salvo.'
  end

  ## tenta adicionar novo arquivo no monitoramento 
  def apk_add(file)
    file.gsub!('"', '')
    puts "adicionando apk \"#{file}\"..."
    verify(file)
    search
  end

  ## remove arquivo do monitoramento pelo índice
  def apk_del(index)
    index -= 1
    puts "removendo apk \"#{@apks[index].path}\"..."
    @apks.delete_at(index)
    search
  end

  ## imprime arquivos do monitoramento
  def apk_pri
    puts "\nPrint Apks:"
    @apks.each do |apk|
      puts apk.index.to_s + "\t" + (apk.fname + (' ' * 30))[0, 30] + "\t" + apk.size.to_s + "\t" + apk.mtime.to_s
    end
  end

  ## imprime paths dos arquivos do monitoramento
  def path_pri
    puts "\nPrint Paths:"
    @apks.each do |apk|
      puts apk.path
    end
  end

  ## imprime nomes dos arquivos do monitoramento
  def name_pri
    puts "\nPrint Names:"
    @apks.each do |apk|
      puts apk.fname
    end
  end
end

a = MeuAdb.new
