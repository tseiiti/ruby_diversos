#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

arr = []
n.times do |i|
	aux = []
	(arr.count).times { |j|
		aux << arr[j] + arr[j + 1].to_i
	}
	arr = [1] + aux
	puts ' ' * (n - i - 1) + (arr * ' ')
end



=begin
Title: The pascal triangle
Problem: Pascal's triangle is a triangular array of the binomial coefficients. In the Western world, it is named after French mathematician Blaise Pascal
If you see clearly, each number is any row is sum of the two numbers just above it.For example in 3rd row middle number 2 can be obtained by summing above two numbers , which are 1 and 1.The trick can also be used to compute any number of rows for Pascal triangle.Draw Pascal triangle for n number of rows.
Input: Input contains an integer n.
Output: Print Pascal triangle for n number of rows.
Constraints: 1≤n≤10
Sample Input: 5
Sample Output: 
    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
=end
