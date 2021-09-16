#ruby 1.9.3 

inp = gets.chomp

out = 10000 / inp.to_i

puts out



=begin
Title: How many weeks
Problem:  A town in Death Valley has a water tank that contains 10,000 gallons of water. If there is no rain, calculate the number of weeks the water will last for an input weekly water usage.
Input: Input contains positive integer n , which indicates weekly water usage
Output: Output will be number of weeks the water last for.
Constraints: 0<n<10000
Do not include the last week if the water remaining for that week is less than the weekly usage amount.
Sample Input: 1000
Sample Output: 
10
=end
