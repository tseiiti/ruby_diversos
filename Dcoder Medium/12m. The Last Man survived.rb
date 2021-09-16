#ruby 1.9.3 

inp = gets.chomp

inp.to_i.times { |q|
	inp = gets.chomp
	
	arr = []
	inp.to_i.times { |i| arr << i + 1 }
	
	i = 1
	while arr.count > 1
		arr.delete_at(i)
		i += 1
		i = 0 if i == arr.count
		i = 1 if i > arr.count
	end
	puts arr[0]
}



=begin
Title: The Last Man survived
Problem: There are N people standing in a circle in an order 1 to N.
No.1 person has a sword. He kills next person (i.e. No. 2 )and gives sword to next to next (i.e no.3). All person does the same until only one survives.
Which number survives at the last?
Input: First line contains T number of testcase, next T lines each contain an integer N.
Output: For each testcase output which number person survived.
Constraints: 1<=T<=20
1<=N<=500
Sample Input: 3
7
100
245
Sample Output: 
7
73
235
=end
