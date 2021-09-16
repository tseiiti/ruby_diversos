#ruby 1.9.3 

inp = gets.chomp
inp = gets.chomp
arr = inp.split(' ').map(&:to_i)

out = arr.inject(:+).to_f / arr.count.to_f

if out - 0.5 == out.to_i
	out -= 0.5
end

puts out.round



=begin
Title: The closest to Average
Problem: You are given an array, you have to find the closest integer to its average, look it has to be closest,not just the truncated version of the average.
Input: First line contains n , number of elements of array, next line contains n integer separated by a space, which are elements of the array.
Output: Print output according to given condition.See Sample output.
Constraints: 1≤n≤100
1≤ element of array ≤ 1000 
Sample Input: 2
10 15
Sample Output: 
12
=end
