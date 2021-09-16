#ruby 1.9.3 

@arr = []
@arr << 1 << 1
60.times do |i|
	@arr << @arr[i] + @arr[i + 1]
end

def src(n)
	@arr.each { |e| return e if e > n }
end

inp = gets.chomp
inp.to_i.times do |i|
	inp = gets.chomp
	n = inp.to_i
	puts src(n)
end



=begin
Title: Guess the Fibonacci number
Problem: The Fibonacci sequence is a series of numbers where a number is found by adding up the two numbers before it. Starting with 0 and 1, the sequence goes 1, 1, 2, 3, 5, 8, 13, 21, 34, and so forth.
Written as a rule, the expression is x(n) = x(n-1) + x(n-2).
Given an integer you have to find next fibonacci number using your code.
Input: First line of the input contains n, next n lines contain each an integer,whose next fibonacci number is to be found.
Output: Print the next fibonacci number for each integer in a newline.
Constraints: 1≤n≤100 
Your Code should work well for atleast first 60 fibonacci numbers.
Sample Input: 4
1
10
11
15
Sample Output: 
2
13
13
21
=end
