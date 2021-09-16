# encoding: utf-8
require 'io/console'
system('cls')

cmd_list = %w[enable end print time]

sep_list = [ "\t", "\n", "(", ")", "{", "}", "[", "]", "" ]

str = ""
chr = ""



str = gets

#     # system("stty raw -echo")
#     STDIN.raw!
# 10.times do |n|
# # STDIN.iflush
# 	chr = STDIN.getch
# 	# chr = STDIN.getc
# 	# chr = STDIN.noecho(&:gets)
# 	# puts chr.class
# 	# if chr.ord == 10
# 	# 	chr = STDIN.getch
# 	# 	# chr = STDIN.getc
# 	# end

# 	if sep_list.include?(chr)
# 		puts "separação: " + chr + chr.ord.to_s
# 		# break
# 	end

# 	str += chr
# 	count = 0
# 	cmd_list.each do |cmd|
# 		if str == cmd[0, str.length]
# 			count += 1
# 		end
# 		if count > 1
# 			break
# 		end
# 	end

# 	if count == 1
# 		puts "comando: " + str
# 		break
# 	end
# end

puts str