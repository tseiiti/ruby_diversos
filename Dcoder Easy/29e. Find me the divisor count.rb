#ruby 1.9.3 

inp = gets.chomp
arr = inp.split(' ').map(&:to_i)
l = arr[0]
m = arr[1]
n = arr[2]

out = 0
(l..m).each do |i|
	out += 1 if i % n == 0
end

puts out



=begin
Title: Find me the divisor count
Problem: Cody was solving a programming puzzle in Dcoder, and as always he is unable to do it alone. Puzzle statement is You are given three integers l,h,d and you have to find that how many integers between l and h  (inclusive) are divisible by d.Lets help Cody.
Input: Input contains 3 integers l,h and d respectively separated by a space.
Output: Print the number of divisors as stated in the problem.
Constraints: 1≤l,h,d≤1000
Sample Input: 3 15 5
Sample Output: 
3
=end
