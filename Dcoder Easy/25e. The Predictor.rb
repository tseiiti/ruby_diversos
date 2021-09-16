#ruby 1.9.3 

inp = gets.chomp

if inp.include? '111111' or inp.include? '000000'
	puts 'Bad'
else
	puts 'Good'
end



=begin
Title: The Predictor
Problem: Cody always wanted to have some psychic powers so that he could showoff his skills, and magic to people and impress them, specially his girlfriend.But, in spite all his efforts, hardwork, dedication, Googling, watching youtube videos he couldn't garner any psychic abilities!
He knew everyone was making fun of him, so to stop all of that - he came up with a smart plan. Anyone who came to him to know about their future, he asked them to write a binary number for him - and then, he smartly told them if the future for that person had good in store, or bad.The trick Cody used was if the binary number has six consecutive 0's or 1's their future is bad, else their Future is Good.
Input: Input contains a single line a binary number n
Output: Print "Good" or "Bad" without quotes (for fututre prediction) based on Cody's trick
Constraints: 0≤n≤10000
Sample Input: 0011111100
Sample Output: 
Bad
=end
