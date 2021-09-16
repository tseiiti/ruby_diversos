#ruby 1.9.3 

inp = gets.chomp

n = inp.to_i.abs

puts n.to_s.reverse if n <= 10000



=begin
Title: Reverse me
Problem: You are given an integer, reverse it.
Input: Input contains an integer n.
Output: Print reverse of integer.
Constraints: 1≤n≤10000
Sample Input: 9956
Sample Output: 
6599
=end
