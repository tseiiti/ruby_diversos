#ruby 1.9.3 

inp = gets.chomp
arr = inp.split(' ').map(&:to_i)
m = arr[0]
n = arr[1]

puts m ** n



=begin
Title: Learning Powers with Loops
Problem: M^n is termed as M raise to power n.Avik is weak at Maths, help him learning powers by calculating M^n with programming.
Input: Two space separated positive integer M and n
Output: Output will be M^n
Constraints: 0<=M<=50 0<=n<=10
Sample Input: 2 3
Sample Output: 
8
=end
