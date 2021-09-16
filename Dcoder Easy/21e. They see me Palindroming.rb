#ruby 1.9.3 

inp = gets.chomp
if inp[0] == inp[4] && inp[1] == inp[3]
	out = 'Yes'
else
	out = 'No'
end
puts out



=begin
Title: They see me Palindroming
Problem: In india there is a puzzle"5 characters my name, reverse- forward is the same." You will be presented with a 5 character String, you have to tell whether it satisfy above puzzle, if yes output "Yes" else "No"
Input: Input is String S of 5 characters.
Output: Print "Yes" if the String S satisfies above constraints, else "No".
Constraints: String length = 5
Sample Input: level
Sample Output: 
Yes
=end
