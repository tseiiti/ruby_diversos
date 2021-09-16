#!/usr/bin/ruby
require "highline/system_extensions" # gem install highline
include HighLine::SystemExtensions
CLS = "cls"

system(CLS)
cmd_list = %w[pause clear clock configure connect copy debug delete dir disable disconnect enable erase exit logout more no ping reload resume setup show ssh telnet terminal traceroute undebug vlan write]
cmd = "x"

Thread.new do
  loop do
		cmd = gets.delete("\n")
		c = get_character
		char = c.chr
		print char
		if char == "z" # "\b".include? char
			break
		elsif char == "\b" # "\b".include? char
			p c
			p char
			char = ""
			cmd = cmd[0, cmd.lenght - 2]
		elsif char == "\n" || char == "\r" # "\n\r".include? char
			p c
			p char
			char = ""
			cmd = cmd
		elsif char == "\t"
			# auto_complete
			if found_list.count == 1
				cmd = found_list.first
			else
				puts found_list.inspect
			end
			char = ""
		end
		cmd += char
		found_list = cmd_list.select { |e| e =~ Regexp.new("^" + cmd) }
	end
	puts "\n\n*************"
	puts "termino"
	puts "*************\n"
end

loop do
	puts cmd
	break if %w[exit stop quit].include? cmd
	sleep(1)
end

# found_include_list = cmd_list.select { |e| e =~ Regexp.new(cmd) }
