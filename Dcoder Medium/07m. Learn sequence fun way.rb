#ruby 1.9.3

inp = gets.chomp
inp = gets.chomp
#inp = '3 1 -2 -2 -1 3'
arr = inp.split(' ').map(&:to_i)

seq = 'first'
out = 'Yes'
t = arr[0]
arr[1..arr.length].each do |n|
	if seq == 'first' && n >= t
		seq = 'second'
	elsif seq == 'second' && n <= t
		out = 'No'
		break
	end
	t = n
end

puts out	



=begin
Title: Learn sequences fun way
Problem: You are given S - a sequence of n integers S = s1, s2, ..., sn. Please, compute if it is possible to split S into two parts: s1, s2, ..., si and si+1, si+2, ..., sn  in such a way that the first part is strictly decreasing while the second is strictly increasing one, both the parts not necessarily to be having equal number of integers.
Input: First line contains n, next line contains n integers separated by space.
Output: Yes or No, based on condition specified.
Constraints: 2<=n<=100
-100 <= si <= 100
Sample Input: 6
3 1 -2 -2 -1 3
Sample Output: 
Yes
=end
