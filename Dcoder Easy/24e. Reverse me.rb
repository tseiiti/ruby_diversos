#ruby 1.9.3 

inp = gets.chomp

n = inp.to_i.abs

puts n.to_s.reverse if n <= 10000
