require 'io/console'
system('cls')

cmd_list = ["enable", "configure", "end"]



string = ""
10.times do
  char = STDIN.getch
  print char.to_s
  string += char
  len = string.length

  count = 0
  command = ""
  cmd_list.each do |cmd|
    if string == cmd[0, len]
      count += 1
      command = cmd
    end
  end

  if count == 1
    puts "\n"
    puts command
    break
  end
end

