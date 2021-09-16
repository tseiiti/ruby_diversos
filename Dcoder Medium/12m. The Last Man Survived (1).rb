#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

n.times do |i|
	inp = gets.chomp
	m = inp.to_i
	arr = []
	m.times {
		|j|
		arr << j + 1
	}

out = 1
arr.each { |i|
	out = (out * i) % (10 ** 9 + 7)
}

puts out