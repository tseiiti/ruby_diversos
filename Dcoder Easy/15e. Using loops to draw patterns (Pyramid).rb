#ruby 1.9.3 

(0..4).each do |i|
	n = 5 - i
	lin = (' ' * (n - 1)) + ('*' * (i * 2 + 1)) 
	puts lin
end



=begin
Title: Using loops to draw patterns(Pyramid)
Problem: Draw the pattern specified using loops.
Input: 
Output: The pattern as shown in sample output.
First line contain 4 space and 1 star, next line contains 3 space and 3 stars and so on..
Constraints: Try not to hardcode the output.
Sample Input: 
Sample Output: 
    *
   ***
  *****
 *******
*********
=end
