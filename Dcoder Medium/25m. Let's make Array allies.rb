#ruby 1.9.3 

inp = gets.chomp
arr = inp.split.map(&:to_i)
k = arr[1]

inp = gets.chomp
arr = inp.split.map(&:to_i).sort.reverse

puts arr[k - 1]



=begin
Title: Let's make Arrays allies.
Problem: Cody's girlfriend loves Arrays.She is a sorted girl, hence likes sorted arrays. Being a Coder Cody decide to give her a Sorted array but this time she demanded even more, she said she needed kth largest element of this array, now cody is puzzled. He dont have an idea to do this, you need to help Cody making a program to do so.
Input: First line of the input contains n and k separated by space, next line contains n integers separated by a space representing elements of array.
Output: Print the kth largest element of the array given.
Constraints: 1≤n≤100 
1≤ element of array≤100000
Sample Input: 4 2
4 11 10 15
Sample Output: 
11
=end
