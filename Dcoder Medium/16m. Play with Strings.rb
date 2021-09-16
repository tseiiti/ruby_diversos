#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

n.times do
	inp = gets.chomp
	arr = inp.split(' ')
	arr.map(&:reverse!)
	puts arr.join(' ')
end



=begin
Title: Play with Strings
Problem: Your are given a sentence, you have to reverse its Words, but with your Code.
Input: First line contains n,no. of TestCases , next n lines, each contain a sentence.
Output: For each TestCase print the string with words reversed.
Constraints: 1≤n≤100
1≤ String length ≤ 100
Output lines should not have leading or trailing white space.
Sample Input: 1
I love Dcoder
Sample Output: 
I evol redocD
=end
