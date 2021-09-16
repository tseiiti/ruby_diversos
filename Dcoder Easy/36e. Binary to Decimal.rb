#ruby 1.9.3 

inp = gets.chomp

l = inp.length
out = 0
l.times do |i|
	n = inp[l - i - 1].to_i
	out += n * 2 ** i
end

puts out



=begin
Title: Binary to Decimal
Problem: Write a code which converts a binary number (written as string) into a decimal number.
Input: Input is a binary number.
Output: The output is a decimal number.(interger value)
Constraints: The binary number is non-negative and the resultant decimal number is an integer.
Sample Input: 101
Sample Output: 
5
=end
