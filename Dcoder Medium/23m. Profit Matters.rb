#ruby 1.9.3 

inp = gets.chomp
arr = inp.delete('[]').split(',').map(&:to_i)
out = []
out << arr.min << arr.max
puts out.uniq.to_s.delete(' ')



=begin
Title: Profit Matters!
Problem: Romeo started to open up a small shop to help his earning, he buys in a range of goods. In order to earn profit help Romeo to keep a tab on the minimum and maximum price of goods purchased by writing a code which returns an array having minimum and maximum values of the values from the input array. 
NOTE: There will atleast one input value and all inputs are non-zero and non-negative.
Input: Let's consider two examples where the price of products purchased are arranged in an array as [1,598,4,36,52] and [15].
Output: The output in case of first example will be an array having minimum and maximum values from the input as [1,598] and output in second case will contain only single value as input had only one value. ie [15].
Constraints: size of array < 1000
input is non-zero non-negative and < 1000000
Sample Input: [1,15,236,854]
Sample Output: 
[1,854]
=end
