#ruby 1.9.3 

inp = gets.chomp
n = inp.to_i

arr = []
(2..n).each do |e|
	isPrime = true
	(2...e).each do |i|
		if e % i == 0
			isPrime = false
			break
		end
	end
	arr << e if isPrime
end

achou = 0
arr.count.times do |i|
	a = arr[i]
	break if a > n / 2
	
	arr.count.times do |j|
		b = arr[arr.count - j - 1]
		if a + b == n
			puts a.to_s + ' ' + b.to_s
			achou += 1
		end
	end
	
end

puts 'No' if achou == 0



=begin
Title: Prime numbers : My friends
Problem: A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself. A natural number greater than 1 that is not a prime number is called a composite number. For example, 5 is prime because 1 and 5 are its only positive integer factors, whereas 6 is composite because it has the divisors 2 and 3 in addition to 1 and 6.
One of the legend in mathematics was S. Ramanujan from India.According to other mathematicians numbers were his friends.Now giving a number to him, he could easily tell if it could be described as sum of 2 prime numbers.
In 21st century We are Coding Guys, so we solve the problem in our own way. So you just have to Write code to print 2 different prime numbers, whose sum is given number.There may be more then one combination, print all of them separated by new line in an incresing order, each pair.
Check sample test case for a better explanation.
Input: Input contains an integer n.
Output: Print combination of prime pairs for given number, each pair should be in increasing order, and all the combinations should also be in incresing order.
If the number can't be described by such a combination print"No" without quotes.
Constraints: 1≤n≤100
Sample Input: 34
Sample Output: 
3 31
5 29
11 23
17 17
=end
