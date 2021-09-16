#ruby 1.9.3 

inp = gets.chomp
inp = gets.chomp
arr = inp.split.map(&:to_i)
aux = arr.uniq
aux.each do |e|
	puts e if arr.count(e) == 1
end



=begin
Title: The one and only
Problem: Consider an array A of n integers,where all but one of the integers occure in pairs.
Every element in A occures twice except for one.
Find that unique element.
Input: First line contains an integer n, represent number of elements of array.Next line contains n space separated integers, the elements of array.
Output: Print the unique element.
Constraints: 0≤n≤100
0≤ element of array ≤ 100
Sample Input: 5
2 2 4 5 4
Sample Output: 
5
=end
