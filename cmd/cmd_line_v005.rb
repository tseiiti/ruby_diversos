#!/usr/bin/ruby
# require "highline/system_extensions" # gem install highline
# require 'thread'
require 'io/console'

# include HighLine::SystemExtensions
CLS = "cls"

system(CLS)
mutex = Mutex.new
cmd_list = %w[pause exit stop quit]
found_list = []
cmd = ""
chr = ""

thread = Thread.new do
  loop do
		mutex.synchronize do
			# cmd = gets.delete("\n")

			# c = get_character
			# chr = c.chr
			chr = STDIN.getch
			p chr

			if chr == "\n" || chr == "\r"; cmd = ""
			elsif chr == "\x03"; cmd = chr; exit
			elsif chr == "\b"; cmd = cmd[0, cmd.length - 1] if cmd.length > 0
			elsif chr == "\t"
				# auto_complete
				if found_list.count == 1
					cmd = found_list.first
				else
					puts found_list.inspect
				end
			else
				cmd += chr
			end
			chr = ""
			found_list = cmd_list.select { |e| e.start_with? cmd }
		end
	end
	puts "\n\n*************"
	puts "termino"
	puts "*************\n"
end

loop do
	puts cmd
	while %w[pause].include? cmd; sleep(1); end
	exit if %w[exit stop quit].include? cmd
	exit if cmd == "\x03"
	sleep(0.5)
end

# found_include_list = cmd_list.select { |e| e =~ Regexp.new(cmd) }

