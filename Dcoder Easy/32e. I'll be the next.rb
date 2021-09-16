#ruby 1.9.3 

inp = gets.chomp

aux = ('A'..'z').to_a.join

out = ''
(0...inp.length).each do |i|
	out += aux[aux.index(inp[i]) +1]
end

puts out



=begin
Title: I'll be the next
Problem: You are given a string, you have to convert each letter in the string with the next one.For example a becomes b and C becomes D.
Input: Input contains a string s.
Output: Print the manipulated string according to the problem.
Constraints: 1≤length of string≤100
Sample Input: Dcoder
Sample Output: 
Edpefs
=end
