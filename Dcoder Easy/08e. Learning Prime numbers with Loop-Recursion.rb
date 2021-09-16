#ruby 1.9.3 

def is_prime(n)
	return false if n == 1
	for i in 2..n - 1
		return false if n % i == 0
	end
	puts n
end

inp = gets.chomp
arr = inp.split(' ').map { |i| i.to_i }
m = arr[0]
n = arr[1]

(m..n).each do |i|
	is_prime i
end



=begin
Title: Learning Prime numbers with Loop/Recursion
Problem: Raja Beta is bad at maths, his teacher always complaints about him.Help him in his prime numbers homework.
Input: Two space separated positive integer m and n
Output: Print all prime numbers p such that m <= p <= n, one number per line
Constraints: 1 <= m <= n <= 1000000000
Sample Input: 1 10
Sample Output: 
2
3
5
7
=end
