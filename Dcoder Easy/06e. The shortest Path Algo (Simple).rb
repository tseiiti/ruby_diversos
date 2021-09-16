#ruby 1.9.3 

inp = gets.chomp

arr = inp.split(' ').map { |i| i.to_i.abs }

a = arr[0] + arr[1]
b = arr[2] + arr[3]

puts (b < a ? 'B' : 'A')



=begin
Title: The shortest Path Algo(Simple)
Problem:  The Jones Trucking Company tracks the location of each of its trucks on a grid similar to an (x, y) plane. The home office is at location (0, 0). Read the coordinates of truck A and the coordinates of truck B and determine which is closer to the office.
Input: Input contains 4 space separated integers, first 2 are x,y for truck A, next are x,y for truck B.
Output: Output will be either A or B, bases on which one is closer to home office.
Constraints: The x-coordinate is in the range –20 .. 20. The y-coordinate is in the range –20 .. 20
Sample Input: 3 -2 -5 -3
Sample Output: 
A
=end
