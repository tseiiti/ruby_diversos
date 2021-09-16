#ruby 1.9.3 

inp = gets.chomp
arr = inp.split(/\W/)

out = ''
arr.each do |wrd|
	if wrd.length > out.length
		out = wrd
	end
end

puts out



=begin
Title: The longest word.
Problem: You are given a string s.You need to find the longest word from the string. If there are two or more words that are of same length, return the first word from the string with that length. Ignore punctuations.
Input: Input contains a String s
Output: Print output as problem statement.
Constraints: 1≤S length ≤100
PS: Include all the punctuation marks in your code.
Sample Input: coder&!! dcoder
Sample Output: 
dcoder
=end
