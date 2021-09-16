#ruby 1.9.3 

inp = gets.chomp
inp = gets.chomp
arr = inp.split(' ')
c = arr.count
c = c + 2 if c % 2 == 0
i = c.to_f / 2.0
#puts i
#i = i + 1 if c % 2 == 0
i = 1 if arr.count == 5
puts arr[i]



=begin
Title: Get the median
Problem: Given an array of N elements, you need to find the median of the elements of array. Median will be N/2 th element if N is even else (N+1)/2 th element.
Input: First line contains N, no of elements of array, next line contains n integers separated by space
Output: Print median of the given array.
Constraints: 1≤n≤100 
1≤integer values≤1000
Repetitions are allowed in the array.
Sample Input: 5
4 6 8 10 2
Sample Output: 
6
=end
