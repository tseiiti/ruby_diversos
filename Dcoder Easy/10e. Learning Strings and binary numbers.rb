#ruby 1.9.3 

inp = gets.chomp

arr = inp.split(' ')

a = arr[0]
b = arr[1]

puts (a.include?(b) ? 1 : 0)



=begin
Title: Learning Strings and binary numbers
Problem: Given two binary strings, A (of length 10) and B (of length 5), output 1 if B is a substring of A and 0 otherwise.
Input: Binary string A and B separated by a space.
Output: The logical value of: 'B is a substring of A'.
 ie. 1 if B is substring of A else 0.
Constraints: 
Sample Input: 1010110010 10110
Sample Output: 
1
=end
