#ruby 1.9.3 

inp = gets.chomp
arr = inp.split(' ').map { |i| i.to_i }
a = arr[0]
b = arr[1]

out = 0
(a..b).each do |i|
	out += i * i
end
puts out



=begin
Title: Sum of squares
Problem: Compute the sum of squares for the given numbers: a, a+1, ..., b-1, b.
Input: Two natural numbers a and b separated by a space.
Output: Computed sum: a*a + (a+1)*(a+1) + ... + (b-1)*(b-1) + b*b
Constraints: 1 <= a <= b <=100
Sample Input: 2 4
Sample Output: 
29
=end
