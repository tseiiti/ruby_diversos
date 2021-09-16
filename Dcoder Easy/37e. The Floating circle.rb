#ruby 1.9.3 

inp = gets.chomp

r = inp.to_f

f = 3.14 * r ** 2.0

if r <= 0
	puts '0'
else
	puts sprintf('%.2f', f)
end



=begin
Title: The Floating circle
Problem: Cody is a student in Trumph Academy, He is preparing for SSC , while he was solving some problems, he found an easy problem of Circles. The problem is You have to calculate area of a Circle , radius of circle is given.He decided to solve it using code, let us help Cody solving the problem.
Input: Input containts a float number,radius of circle r.
Output: Print area of circle.
If radius is negative area would be "0" without quotes.
PS: Take PI=3.14 and answer should be precise to 2 digit after '.' 
Constraints: -1000≤r≤1000
Sample Input: 5
Sample Output: 
78.50
=end
