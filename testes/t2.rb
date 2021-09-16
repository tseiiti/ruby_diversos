require "highline/system_extensions"  # gem install highline
include HighLine::SystemExtensions

print "Enter one character:  "
char = get_character
puts char


ch = gets.chomp
puts ch