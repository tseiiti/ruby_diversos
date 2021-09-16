#ruby 1.9.3 

inp = gets.chomp
t = inp.to_i

t.times do |i|
	inp = gets.chomp
	arr = inp.split(' ').map(&:to_i)
	
	n = arr[0]
	x = arr[1]
	y = arr[2]
	
	arr = (2...n).select { |j| j % x == 0 && j % y != 0 }
	puts arr.join(' ')
end



=begin
Title: The divisibility Test
Problem: Print all integers ai such that ai is divisible by x and not divisible by y
Input: First, you are given t - the number of test cases.
In each of the following t lines, 3 integers: n x y.
Output: In each of the following t lines, ai specified by problem, separated by a single space in ascending order.
Constraints: 1 < ai < n < 100000
You might assume also that x < n and x is not divisible by y.
Sample Input: 2
9 2 5
20 5 16
Sample Output: 
2 4 6 8
5 10 15
=end
