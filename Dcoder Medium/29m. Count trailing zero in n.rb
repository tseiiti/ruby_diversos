#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i
puts n / 5 + n / 25


#out = 1
#(1..n).each do |i|
#	out *= i
#	x = i / 5 + i / 25
#	#puts out.to_s + ' ' + i.to_s + ' ' + x.to_s + ' '
#	print out.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
#	puts ' ' + i.to_s + ' ' + x.to_s + ' '
#end



=begin
Title: Count trailing zeroes in n!
Problem: Given a number n, find the number of trailing 0s in factorial of this number n! without calculating n!
Input: Input contains an integer n.
Output: Print number of trailing 0s in n!
Constraints: 0≤n≤100000
Sample Input: 100
Sample Output: 
24
=end
