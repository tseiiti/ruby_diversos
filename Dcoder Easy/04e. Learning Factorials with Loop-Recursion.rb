#ruby 1.9.3 

inp = gets.chomp

out = 1
(1..inp.to_i).each do |i|
	out *= i
end

puts out



=begin
Title: Learning User Input with Natural Numbers
Problem: The numbers 1,2,3.. are known as Natural numbers. Calculate the sum of all the natural numbers from 1 to N, where N will be the input.
Input: A positive integer N
Output: Output will be sum of numbers from 1 to N
Constraints: 1<N<1000
Sample Input: 5
Sample Output: 
15
=end
