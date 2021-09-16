#ruby 1.9.3 

inp = gets.chomp
arr = inp.split(' ').map(&:to_f)
a = arr[0]
b = arr[1]
c = arr[2]

d = (b ** 2 - 4 * a * c) ** 0.5
x1 = (-1 * b + d) / (2 * a)
x2 = (-1 * b - d) / (2 * a)

puts format('%.2f', x1 + x2)



=begin
Title: Roots Roots Roots!
Problem: Help Dexter to learn maths in a fun way by writing a code which returns the sum of the roots of a quadratic equation (if any) upto two decimal places. 

Input: The input contains three field 'a', 'b' and 'c' where 'a','b','c' are respectively the coefficients of x^2, x and the constant term separated by space.
Output: Output contains the sum of roots of the euation (if any) upto two decimal places or an empty field (a space character in case of no solution).
Constraints: -1000 < (a,b,c) <1000
Sample Input: 1.0 -2.0 1.0
Sample Output: 
2.00
=end
