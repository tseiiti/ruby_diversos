#ruby 1.9.3 

inp = gets.chomp

arr = inp.split(' ').map { |i| i.to_i }

a = arr[0]
b = arr[1]

if a + b > 21
	first = true
	if a == 11
		a = 1
		first = false
	end
	b = 1 if b == 11 && first
end

out = a + b

puts (out > 21 ? 0 : out)



=begin
Title: The BlackJack with conditions.
Problem: Write a program to play a variety of BlackJack. In general, given two numbers, a and b, return their sum.
If the sum is greater than 21, return 0, unless one of the numbers is 11. In such a case, the 11 should be 'converted' to a 1 to prevent the sum from being exceeded.
For example, given a 11 and 13 as input, the 11 should be 'converted' into a 1 so the total sum will be 14.
Input: Input contains 2 space separated integers, a and b
Output: Output will be in general sum of a and b, if sum exceed 21, return 0, unless one of the numbers is 11. In such a case, the 11 should be 'converted' to a 1 to prevent the sum from being exceeded.
For example, given a 11 and 13 as input, the 11 should be 'converted' into a 1 so the total sum will be 14.
Constraints: 0<=a<50
 0<=b<50
Sample Input: 11 13
Sample Output: 
14
=end
