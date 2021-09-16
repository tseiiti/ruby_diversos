#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

sum = n.times.inject(:+)
puts sum * 2



=begin
Title: The coding Challenges
Problem: There are n participants appearing for one on one coding challenge.Each participant plays twice (challenges) with each of his opponents.You need to compute the total number of challenges. 
Input: First line contains an integer n, represent number of participants.
Output: Print the total number of challenges.
Constraints: 1≤n≤100
Sample Input: 16
Sample Output: 
240
=end
