#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

n.times do |i|
	e = o = ''
	inp = gets.chomp
	l = inp.length
	l.times do |j|
		if j % 2 == 0
			e += inp[j]
		else
			o += inp[j]
		end
	end
	puts e + ' ' + o
end



=begin
Title: Learning even odds with Strings and Loops
Problem: Given a string, str, of length N that is indexed from 0 to N-1, print its even-indexed and odd-indexed characters as  space-separated strings on a single line
Note: 0 is considered to be an even index. 
Input: The first line contains an integer, t (the number of test cases).Each line  of the  subsequent lines contain a String ,str 
Output: For each String str , print str's even-indexed characters, followed by a space, followed by str's odd-indexed characters.
Constraints: 1<=t<=10 
2<=length of str<=20
Sample Input: 2
Dcoder
Algorithm
Sample Output: 
Doe cdr
Agrtm loih
=end
