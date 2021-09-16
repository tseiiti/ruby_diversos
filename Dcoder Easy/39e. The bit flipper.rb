#ruby 1.9.3 

num = gets.chomp

num.gsub!(/0/, '2')
num.gsub!(/1/, '0')
num.gsub!(/2/, '1')

puts num



=begin
Title: The bit flipper
Problem: You are given a binary number, you just need to flip each and every bit of it ie. 1 turns to 0 and 0 turns to 1.
Input: Input contains a binary number.
Output: Print the flipped binary number.
Constraints: The binary number can be any binary number of 0 bit to 32 bit.
Sample Input: 11100110101
Sample Output: 
00011001010
=end
