# encoding: utf-8

system('cls')

# puts "Entre com o texto: "
# text = gets.chomp

# words = text.split(" ")
# frequencies = Hash.new(0)
# words.each { |word| frequencies[word] += 1 }
# frequencies = frequencies.sort_by { |a, b| b }
# frequencies.reverse!
# frequencies.each { |word, frequency| puts word + " " + frequency.to_s }

# menagerie = { raposa: 2,
#   girafa: 1,
#   magos: 17,
#   elfos: 1,
#   canários: 4,
#   presunto: 1
# }

# puts 'menagerie ' + menagerie.object_id.to_s
# puts 'menagerie[:girafa] ' + menagerie[:girafa].to_s + ' ' + menagerie[:girafa].object_id.to_s
# puts 'menagerie[:magos] ' + menagerie[:magos].to_s + ' ' + menagerie[:magos].object_id.to_s

# puts 'string ' + "string".object_id.to_s
# puts 'string ' + "string".object_id.to_s

# puts ':symbol ' + :symbol.object_id.to_s
# puts ':symbol ' + :symbol.object_id.to_s







# require 'benchmark'

# string_AZ = Hash[("a".."z").to_a.zip((1..26).to_a)]
# symbol_AZ = Hash[(:a..:z).to_a.zip((1..26).to_a)]

# string_time = Benchmark.realtime do
#   100_000.times { string_AZ["r"] }
# end

# symbol_time = Benchmark.realtime do
#   100_000.times { symbol_AZ[:r] }
# end

# puts "Tempo usando string: #{string_time} segundos."
# puts "Tempo usando símbolos: #{symbol_time} segundos."






# movies = {
#   Memento: 3,
#   Primer: 4,
#   Ishtar: 1
# }

# puts "O que você gostaria de fazer?"
# puts "-- Digite 'add' para adicionar um filme."
# puts "-- Digite 'update' para atualizar um filme."
# puts "-- Digite 'display' para mostrar todos os filmes."
# puts "-- Digite 'delete' para deletar um filme."

# choice = gets.chomp.downcase
# case choice
# when 'add'
#   puts "Que filme você gostaria de adicionar?"
#   title = gets.chomp
#   if movies[title.to_sym].nil?
#     puts "Qual a nota? (Digite um número de 0 a 4.)"
#     rating = gets.chomp
#     movies[title.to_sym] = rating.to_i
#     puts "#{title} foi adicionado com uma nota de #{rating}."
#   else
#     puts "Esse filme já existe na lista! Sua nota é #{movies[title.to_sym]}."
#   end
# when 'update'
#   puts "Que filme você gostaria de atualizar?"
#   title = gets.chomp
#   if movies[title.to_sym].nil?
#     puts "Filme não encontrado!"
#   else
#     puts "Qual é a nova nota? (Digite um número de 0 a 4.)"
#     rating = gets.chomp
#     movies[title.to_sym] = rating.to_i
#     puts "#{title} foi atualizado, sua nova nota é #{rating}."
#   end
# when 'display'
#   movies.each do |movie, rating|
#     puts "#{movie}: #{rating}"
#   end
# when 'delete'
#   puts "Que filme voce gostaria de deletar?"
#   title = gets.chomp
#   if movies[title.to_sym].nil?
#     puts "Filme não encontrado!"
#   else
#     movies.delete(title.to_sym)
#     puts "#{title} foi deletado."
#   end
# else
#   puts "Desculpa, não entendo o que você quer."
# end






def yield_name(parametro)
  puts "processamento pessado que não faço idéia como é..."
  yield("Devolvo parte dos parametros")
  puts "mais processamentos e devolvo outros"
  yield(parametro)
  puts "terminando..."
end
yield_name("teste") { |n| puts "faço o que quero com o retorno '#{n}'." }






multiples_of_3 = Proc.new { |n|
  n % 17 == 0
}
puts (1..100).to_a.select(&multiples_of_3)






def greeter
    yield("Olá!")
end
phrase = Proc.new { |s| puts s }
greeter(&phrase)




# 5.times { |x| puts x }

=begin
Ruby map, each, collect, inject, reject, select quick reference

map

performs an action on each array element. The original array is not modified. Returns the modified array.

irb> [1,2,3,4,5,6,7,8,9,10].map{|e| e*3}
=> [3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
each

executes an action using as parameter each element of the array. Returns the unmodified array.

irb> [1,2,3,4,5,6,7,8,9,10].each{|e| print e.to_s+"!"}
1!2!3!4!5!6!7!8!9!10!
=>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
collect

Alias for map

inject

Takes an accumulator (sum) and changes it as many times as there are elements in the array. Returns the final value of the accumulator.

irb> [1,2,3,4,5,6,7,8,9,10].inject{ |sum,e| sum += e }
=> 55
You can also specify an initial value as parameter before the block.

irb> ["bar","baz","quux"].inject("foo") { |acc,elem| acc + "!!" + elem }
=> "foo!!bar!!baz!!quux"
select

runs an expression for each array element and, if it is true, that element gets added to the output which is returned. This is called filter in other languages.

irb> [1,2,3,4,5,6,7,8,9,10].select{|el| el%2==0}
=> [2,4,6,8,10]
detect

Alias for select

reject

The opposite of select: runs an expression for each array element and includes that element in the output if the expression is false

irb> [1,2,3,4,5,6,7,8,9,10].reject{|e| e==2 || e==8}
=> [1, 3, 4, 5, 6, 7, 9, 10]
reduce

Alias for inject
=end

puts "\n\n"

strings = ["1", "2", "3"]
nums = strings.map(&:to_i)
puts strings.inspect
puts nums.inspect


class Codecademy

end

x = 1
puts x.class
x = Codecademy.new
puts x.class
def lambda_demo(a_lambda)
  puts "Eu sou o método!"
  a_lambda.call
end
lambda_demo(lambda { puts "Eu sou o lambda!" })