#ruby 1.9.3 

inp = gets.chomp
arr = 'aeiou'

if arr.include?inp[0]
	puts inp + 'way'
else
	puts inp[1..inp.length] + inp[0] + 'ay'
end



=begin
Title: Learning Strings with Pig Latin
Problem: Pig Latin is a language game that involves altering words via a simple set of rules. Write a Program that takes a string word and applies the following rules to generate a new word in Pig Latin.
If the first letter in word is a consonant, append the consonant plus "ay" to the end of the remainder of the word. For example, pig_latin("pig") would return "igpay".
If the first letter in word is a vowel, append "way" to the end of the word. For example, pig_latin("owl") returns "owlway".
Input: Input would be word to be convereted in Pig Latin
Output: Output would be word according to described problem
Constraints: You can assume that word is in lower case.
Sample Input: pig
Sample Output: 
igpay
=end
