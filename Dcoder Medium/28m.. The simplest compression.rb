#ruby 1.9.3 

inp = gets.chomp
#inp = '2233344441'
#puts inp
arr = inp.scan(/./)
chr = ''
out = ''
cnt = 0
ant = inp[0].to_s
arr.each do |chr|
	if chr != ant
		out += ant
		out += cnt.to_s if cnt > 1
		cnt = 1
	else
		cnt += 1
	end
	ant = chr
end
out += ant
out += cnt.to_s if cnt > 1

puts out



=begin
Title: The simplest compression
Problem: This problem deals with compression.You need to compress a given string and the rule is simple while reading string character by character if any character repeats, replace the repeated part with number of its occurance.
For example:  if a String has 'd' repeated 4 times, replace this "dddd" with "d4".
PS: Your algorithm should make compress version of String only if after your compression algorithm you get a string which is bigger/longer than the given, in that case output the given String.
Input: Input contains a String s
Output: Print the number of numbers greater than n.
Constraints: 1≤s length≤100
Sample Input: dddccfgh
Sample Output: 
d3c2fgh
=end
