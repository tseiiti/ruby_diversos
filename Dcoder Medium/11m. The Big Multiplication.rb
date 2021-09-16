#ruby 1.9.3 

inp = gets.chomp
inp = gets.chomp
arr = inp.split(' ').map(&:to_i)

out = 1
arr.each { |i|
	out = (out * i) % (10 ** 9 + 7)
}

puts out



=begin
Title: The Big Multiplication
Problem: You have been given an array A of size N consisting of positive integers. You need to find and print the product of all the number in this array Modulo (10^9+7)
Input: The first line contains a single integer N, denoting the size of the array. The next line contains N space separated integers denoting the elements of the array.
Output: Print a single integer denoting the product of all the elements of the array Modulo 10^9+7. 
For given input case there are 4 integers to multiply.The modulo 10^9+7 operation is done to keep the answer inside the variable's storage limit, because multiplication of 1000 of element can go really huge, this technique is used, but instead of doing it after final result, we do it on each iteration, to keep variable values in limit
 For given case let answer=1 (initialize)
answer = 1
answer = (answer*1)%(1000000007)
answer = (answer*2)%(1000000007)
answer = (answer*3)%(1000000007)
answer = (answer*4)%(1000000007)
This yields answer to be 24 as required, however performing the process on thousands of elements surely becomes benefitial.
Constraints: 1<=N<=10^3
1<=A[i]<=10^3
Sample Input: 4
1 2 3 4
Sample Output: 
24
=end
