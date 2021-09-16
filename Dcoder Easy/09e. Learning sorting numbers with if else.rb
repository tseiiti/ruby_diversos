#ruby 1.9.3 

inp = gets.chomp
arr = inp.split(' ').map { |i| i.to_i }
arr.sort!

puts arr.map(&:to_s).join(' ')



=begin
Title: Learning sorting numbers with if else
Problem: There are 3 numbers given as input sort them in increasing order.
Input: Three space separated positive integer m,n,p
Output: Print the integers in sorted incresing order separated by space.
Constraints: 0<=m<=500
0<=n<=500
0<=p<=500
Try not using any library function to sort.
Sample Input: 4 86 56
Sample Output: 
4 56 86
=end
