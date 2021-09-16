#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

arr = []
(1..100).each { |i| arr << i ** 2 }

n.times do |i|
	inp = gets.chomp
	m = inp.to_i
	10000.times do |j|
		if arr.include?(m + j) || arr.include?(m - j)
			puts j
			break
		end
	end
end



=begin
Title: The Game of Power
Problem: Avik was studying maths, then he decided to solve its exercises.He stuck at one problem, There are many special numbers that could be in the formula b^e where b indicates the base number, e indicates the power number. But there are also many numbers that couldn't be formed in this formula so the question is to find the minimum absolute difference between a given number N and the nearest special number.
Note: for a special number, b,e integers > 1 .
Input: First line has T, the total number of test cases.
Next T lines, each line has an integer N
Output: For each test case answer every result in a separate line.
For given Sample input The nearest special number from 10 is 9 =3^2, absolute difference = 1.
49 is a special number.
Constraints: 1≤T≤25.
1≤N≤10000.
Sample Input: 2
10
49
Sample Output: 
1
0
=end
