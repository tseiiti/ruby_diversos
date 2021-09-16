#ruby 1.9.3
inp = gets.chomp

a = 0
b = 0
inp.length.times do |j|
	a += 1 if inp[j..j + 2] == '^_^'
	b += 1 if inp[j..j + 2] == '-_-'
end

if a > b
	puts 'Cody is happy with Dcoder'
elsif a < b
	puts 'Cody wants to leave job'
else
	puts "Cody doesn't know what to do"
end



=begin
Title: The ^_^ -_- String
Problem: Cody is a serious coder, he works as problem setter at Dcoder.He usually stays ^_^ but when his codes doesn't work he becomes -_- .You are given a string which consist of Cody's mood emojis, what you have to do is tell us whether cody is happy with coding on an average or sad?
Input: Input contains a string which has ^_^ and -_-
Output: Print "Cody is happy with Dcoder" if occurance of ^_^ is more than that of -_- else "Cody wants to leave job" without quotes.In case of draw output "Cody doesn't know what to do"
Constraints: 1≤length of string≤100
Sample Input: ^_^_^-_-
Sample Output: 
Cody is happy with Dcoder
=end
