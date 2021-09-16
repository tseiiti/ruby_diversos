#ruby 1.9.3
inp = gets.chomp
arr = ('a'..'z').to_a.join

count = 0
inp.to_i.times do |i|
	inp = gets.chomp
	
	valid = true
	inp.length.times do |j|
		c = inp[j]
		if arr.include?(c)
			unless inp[j - 1..j + 1] == '^' + c + '^'
				valid = false
				break
			end
		end
	end
	count += 1 if valid
end

puts count



=begin
Title: The ^_^ String
Problem: You are given a String,the string consist of ^ _ and characters. Now a string is said to be valid if each character in the string is surrounded by "^" without quotes. You have to find the number of valid strings in given input.
Input: First line of the input contains number n,followed by n strings in each line.
Output: Print the number of strings which are valid.
For given example the first string is valid next one is not, hence output is 1.
Constraints: 1≤n≤100
Sample Input: 2
^a^___^^c^f^^^^^^^_
aa^^^^_^s^
Sample Output: 
1
=end
