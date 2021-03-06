#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

n.times do |i|
	inp = gets.chomp
	case
		when /\w+est\b/.match(inp)
			then puts inp
		when r = /(\w+)er\b/.match(inp)
			then puts r[1] + 'est'
		when /\w+e\b/.match(inp)
			then puts inp + 'r'
		else puts inp + 'er'
	end
end



=begin
Title: Anything You Can Do, I Can Do Better
Problem: You have a colleague that is extremely competitive and always tries to “top” one of your stories. If you say your car is fast, your colleague will say his or her car is faster. If you say your car is faster, your colleague will say his or her car is fastest. After a few such conversations, you realize that you can always predict what your colleague will say next.To demonstrate how annoying this is, you decide to write a program that can accurately predict the responses of your colleague. Your task is to write this program. Specifically, given any adjective, your program will return its comparative form by appending “er” to it. Note that if the adjective already ends in “e”, you should only append “r”. If your program is given an adjective already in its comparative form, your program should return the superlative form of the adjective created by simply replacing the “er” with “est”. Your program should consider any string that ends in “er” to be an adjective in comparative form. if the word given is already in its superlative form ie. ends with “est” ,then return the same word without any change.
Input: The first line of the input contains an integer n that represents the number of data collections that follow where each data collection is on a single line. Each input line contains a string representing an adjective or its comparative form. Each string will be given in all lower case letters.
Output: Your program should produce n lines of output (one for each data collection). Each line should be in lower case letters. If the input is the comparative form of an adjective (ends in “er”), your program should output the superlative form.
Otherwise, your program should output the comparative form of the string given as input.
Constraints: 1<=n<=100
Each input word will have between 1 and 30 characters, inclusive.
Sample Input: 4
warm
smaller
rare
coolest
Sample Output: 
warmer
smallest
rarer
coolest
=end
