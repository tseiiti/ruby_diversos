#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

m = (n ** 0.5).to_s

m = m[0, m.index('.')]

if m.to_i ** 2 == n
	puts 'YES'
else
	puts 'NO'
end



=begin
Title: Square of squares
Problem: You have a hobby of building blocks. You are especially fond of building blocks that are squares. And what you even like more, is to arrange them into a square of square building blocks! /n However, sometimes, you are unable to achieve this goal of yours. If you just had a way to know, whether you're currently working in vain… Wait! That's it! You just have to check if your number of building blocks is a perfect square.
Input: Input is an integer, determine if it's a square number or not.
Output: Output should be YES if the number is a perfect square otherwise NO.
Constraints: Input is an integer (it can be a negative number too)
Sample Input: 25
Sample Output: 
YES
=end
