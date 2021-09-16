#ruby 1.9.3 

inp = gets.chomp
a = inp.scan(/\w/).sort

inp = gets.chomp
b = inp.scan(/\w/).sort

if a.eql?(b)
	puts 'Yes'
else
	puts 'No'
end



=begin
Title: I need equality
Problem: Glin and Cody are brother. They used to fight alot for everything they get.One day their mother gave them Strings, one to each of them, but they started fight again saying their Strings are not equal. Their mother is not able to sort out their fight, so she asked for help to you. You have to tell whether the Strings are equal or not, based on the fact the Strings are called equal if they are permutation of each other.
Input: Two Strings separated by a new Line character.
Output: Print "Yes" if they are equal, otherwise "No", without quotes.
Constraints: 
Sample Input: DcoderPlatform
PatlodercDmfro
Sample Output: 
Yes
=end
