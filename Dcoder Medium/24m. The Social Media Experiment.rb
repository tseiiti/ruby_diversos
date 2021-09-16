#ruby 1.9.3 

inp = gets.chomp
puts inp.split.map(&:capitalize).join(' ')



=begin
Title: The Social Media Experiment!
Problem: Alpha has taken a new liking to social media. Alpha is now very fond of writing quotes on social media. 
 However there is a uniqueness to Alpha's quotes, he takes a quote and converts the first alphabet of each word to uppercase. 
 For example if he chooses to upload the quote 'Happy coding with dcoder' it would appear as 'Happy Coding With Dcoder'.
Input: Input contains the quote (string) written in a general manner.
Output: Output contains the quote (string) with first alphabet of each word capitalized.
Constraints: 
Sample Input: A great artist is a great man in a great child.
Sample Output: 
A Great Artist Is A Great Man In A Great Child.
=end
