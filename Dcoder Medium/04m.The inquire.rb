#ruby 1.9.3 

inp = gets.chomp
inp = gets.chomp
arr = inp.split(' ').map(&:to_i)

inp = gets.chomp
n = inp.to_i

n.times do |i|
	inp = gets.chomp
	aux = inp.split(' ').map(&:to_i)
	a = aux[0] - 1
	b = aux[1] - 1
	puts arr[a..b].inject(:+)
end



=begin
Title: The inquire
Problem: Every tourist visiting our city must visit the May 4 avenue. There are N houses, numbered from 1 to N. There are Pi people living at house i.
The statistic institute is procedding with the survey this year. They will make many queries about the avenue's population. For each query, two numbers A and B. You must determine the total number of people living in all houses from house A to house B, inclusive.
Input: First line contains the number  N (1 <= N <= 105). Second line contains N integers P1, P2, ..., PN, indicating how many people live at each house (for each 1 <= i <= N, 0 <= Pi <= 100).
 Next line contains the integer Q (1 <= Q <= 104), the number of queries to be processed. Each of the next Q lines describes a query with two integers A and B (1 <= A <= B <= N).
Output: For each query, print a line with its result.
Constraints: 
Sample Input: 3
10 2 8
2
1 3
2 2
Sample Output: 
20
2
=end
