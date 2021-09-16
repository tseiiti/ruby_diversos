#ruby 1.9.3 

inp = gets.chomp

puts inp.split.map(&:capitalize)*' '



=begin
Title: Capitalize me
Problem: You will be given a string, all you have to do is capitalize first letter of each word in the given string.
Input: Input contains a string s.
Output: Print the manipulated string according to the problem described.
Constraints: 1≤s length≤1000
Sample Input: i love Dcoder
Sample Output: 
I Love Dcoder
=end
