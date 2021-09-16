#ruby 1.9.3 

inp = gets.chomp
inp = gets.chomp
arr = inp.split(' ').map { |i| i.to_i }
puts arr.inject(:+)



=begin
Title: The sum of Array
Problem: Given the array of N numbers, you have to find its sum.
Input: The first line contains an integer N, number of elements in array.Next line contains N integers separated by space.
Output: Print the sum of the array's elements.
Constraints: 1<=N<=100
Sample Input: 6
1 2 3 4 10 12
Sample Output: 
32
=end
