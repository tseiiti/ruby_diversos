#!/usr/bin/ruby
require "highline/system_extensions" # gem install highline
include HighLine::SystemExtensions
CLS = "cls"
system(CLS)

# Thread.new do
# 	5.times do |i|
# 		print "."
# 		sleep(1)
# 	end
# end

# 3.times do |i|
# 	c = get_character
# 	puts c
# 	puts c.chr
# end

Thread.new do
  loop do
    s = gets.chomp
    puts "You entered #{s}"
    exit if s == 'end'
  end
end

i = 0
loop do
  puts "And the script is still running (#{i})..."
  i += 1
  sleep 1
end

# # teste thread com queue
# require 'thread'
# queue = Queue.new
# producer = Thread.new do
# 	5.times do |i|
# 		sleep rand(i) # simulate expense
# 		queue << i
# 		puts "#{i} produced"
# 	end
# end

# consumer = Thread.new do
# 	5.times do |i|
# 		value = queue.pop
# 		sleep rand(i/2) # simulate expense
# 		puts "consumed #{value}"
# 	end
# end
# consumer.join



# matz = { "Nome" => "Yukihiro",
#   "Sobrenome" => "Matsumoto",
#   "Idade" => 47,
#   "Nacionalidade" => "Japanese",
#   "Apelido" => "Matz"
# }
# puts matz.inspect






# # teste de variavel statica
# class Teste
# 	@@x = "a"

# 	def initialize(attribute)
# 	  @@x = attribute
# 	end

# 	def display
# 		@@x
# 	end

# 	def update(x)
# 		@@x = x
# 	end
# end

# t = Teste.new(gets.chop.to_s)
# puts "t: " + t.display


# u = Teste.new(gets.chop.to_s)
# puts "u: " + u.display
# puts "t: " + t.display

# u.update("b")
# puts "u: " + u.display
# puts "t: " + t.display

