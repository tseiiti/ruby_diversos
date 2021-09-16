#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i
#arr = (0..n).map { |i| 2 ** i }
#puts arr.join(',')

arr = (n < 0 ? (n..0).to_a.reverse : (0..n).to_a)

out = ''
arr.each do |i|
	x = (2 ** i).to_f
	x = x.to_i if x == x.to_i
	out += x.to_s + ','
end

puts out[0, out.length - 1]



=begin
Title: Exponentia!
Problem: Create a code that allows people to learn about exponents.
The task is to write a code which takes an integer number as an input and returns the values ranging from that of 2(two) raised to power 0(zero) to 2(two) raised to power n(the number specified in input)
Input: Input contains the number 'n' for which all the values are returned from power of 2 from 0 to n.
Output: Output contains the values ranging from 2(two) raised to power 0(zero) to 2(two) raised to power n(input) separated by a comma.
Constraints: -1000 ≤ n ≤ 1000
Sample Input: 5
Sample Output: 
1,2,4,8,16,32
=end
