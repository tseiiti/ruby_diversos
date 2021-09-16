#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

n.times do |i|
	inp = gets.chomp
	aux = inp[0..inp.length / 2 - 1]
	out = aux[0].to_s + aux[2].to_s
	#puts inp[0].to_s + inp[2].to_s
	puts out
end



=begin
Title: String - Half of the half
Problem: Given a sequence of 2*k characters, please print every second character from the first half of the sequence. Start printing with the first character.
Input: In the first line of input your are given the positive integer t - the number of test cases. In the each of the next t lines, you are given a sequence of 2*k
Output: For each of the test cases please please print every second character from the first half of a given sequence (the first character should appear).
Constraints: 1<=k<=100
Sample Input: 4
Dcoder
Mobile
Coding
Platform
Sample Output: 
Do
Mb
Cd
Pa
=end
