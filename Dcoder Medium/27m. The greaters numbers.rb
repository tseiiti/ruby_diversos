#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i
arr = inp.scan(/./)

#puts arr.combination(arr.count).to_a

out = 0
aux = arr.permutation.to_a
aux.each do |e|
	out += 1 if e.join.to_i > n
end

puts out



=begin
Title: The greater numbers
Problem: Given a number n, find number of numbers that are greater than n using the same set of digits as n.
Assume number n doesn't contain any duplicate digits.
Input: Input contains an integer n.
Output: Print the number of numbers greater than n.
Constraints: 1≤n≤100000
Sample Input: 123
Sample Output: 
5
=end
