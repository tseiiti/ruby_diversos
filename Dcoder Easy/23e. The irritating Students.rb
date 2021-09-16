#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i
(0...n).each do |i|
	inp = gets.chomp
	j = inp.to_i
	k = (j / 2).to_i
	puts k.to_s + ' ' + (k + j % 2).to_s
end



=begin
Title: The irritating Students
Problem: Cody is Professor at Zing University. He teaches English there. During his first class, he found the students are very talkative. So,he decided to divide the class into two sections, A & B such that the difference between the strength of two sections is minimum. Print the strength of two sections in non decreasing order.
Input: First line of the input contains number of test cases T,followed by T integers (n) (total sum of their strengths)
Output: For each test cases print strength of both section in non decreasing order.
Constraints: 1≤T≤100 
 1≤n≤10000
Sample Input: 2
10
15
Sample Output: 
5 5
7 8
=end
