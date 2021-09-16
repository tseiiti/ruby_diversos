require "highline/system_extensions" # gem install highline
include HighLine::SystemExtensions
system('cls')

@cmd_list = %w[
	clear clock configure connect copy
	debug delete dir disable disconnect
	enable erase exit
	logout
	more no
	ping
	reload resume
	setup show ssh
	telnet terminal traceroute
	undebug
	vlan
	write]

@tab_count = 0
@user_input = ""

def auto_complete
	len = @user_input.length
	cmd_add = @command[len, @command.length - len] + " "
	@user_input += cmd_add
	print cmd_add
end

def list_commands_found
	string = ""
	@cmd_list.each do |cmd|
		if @user_input == cmd[0, @user_input.length]
			string += cmd + " "
		end
	end
	list = string[0, string.length - 1]
	print "\n" + list + "\n" + @user_input
end

def verify(char)
	if char == "\t"
		@tab_count += 1
		if @founds == 1
			auto_complete
		end
	else
		@tab_count = 0
		@user_input += char
		print char
	end

	if @tab_count == 2
		list_commands_found
		@tab_count = 0
	end

	count_founds
end

def count_founds
	@founds = 0
	@command = ""
	@cmd_list.each do |cmd|
		if @user_input == cmd[0, @user_input.length]
			@founds += 1
			@command = cmd
		end
	end
end

20.times do
	char = get_character

	if char == 3
		puts "\nControl + C"
		break
	end

	verify(char.chr)

end





























