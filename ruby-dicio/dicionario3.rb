# encoding: UTF-8

system("cls")
system("clear")

# classe não necessário por enquanto..
class Word
	attr_accessor :word, :term

	def initialize (word, term)
		@word = word
		@term = term
	end
end

# armazena em um array todas as palavras do arquivo
class Dictionary
	attr_accessor :words

	def initialize(file)
		@words = Array.new
		count = 0

		file = File.new(file, "r:ISO-8859-1:UTF-8")
		while (line = file.gets)
			# remove espaços da linha
			line.strip!

			# divide a linha em palavra e terminologia
			i = line.index("/")
			if i.nil?
				word = line[0, line.length]
				term = " "
			else
				word = line[0, i]
				term = line[i + 1, line.length]
			end

			# armazena a palavra separando por tamanhos
			@words[word.length] ||= Array.new
			@words[word.length] << Word.new(word, term)

			count += 1
			if count % 10000 == 0
				print "."
			end
		end
		file.close

		puts "\ninseridos " + count.to_s + " palavras\n"
	end
end

class Shuffles
	attr_accessor :word, :words, :dicio

	def initialize (word, leng)
		@word = word.downcase!
		@dicio = Array.new

		# cria um dicionário do arquivo
		puts "cria o dicionario do arquivo"
		file = "pt-Br_" + "%02d" % leng + ".dic"
		dic = Dictionary.new(file)

		# palavras com tamanho escolhido
		puts "\nseleciona palavras com tamanho " + leng.to_s + " e letras '" + word + "'"
		count = 0

		hash = Hash.new
		(0..word.length - 1).each do |i|
			hash[word[i]] ||= 0
			hash[word[i]] += 1
		end

		dic.words[leng].each do |e|
			hs = hash.clone
			boolean = true

			(0..e.word.length - 1).each do |i|
				# formado somente por caracteres escolhidos
				#if !Regexp.new("[" + e.word[i] + "]", Regexp::IGNORECASE).match(word)
				#	boolean = false
				#	break
				#end
				if hs[e.word[i].downcase].nil?
					boolean = false
					break
				end

				# quantidade de caracteres compativel
				hs[e.word[i].downcase] -= 1
				if hs[e.word[i].downcase] < 0
					boolean = false
					break
				end
			end
			if boolean
				# insere no array
				@dicio << e.word
			end

			count += 1
			if count % 400 == 0
				print "."
			end
		end

		puts "\ninseridos " + count.to_s + " palavras\n\n"
	end

	def shuffle
		@words = Array.new

		# cria um novo objeto da palavra
		word = String.new(@word)

		# transforma em a palavra em array
		wrd = Array.new
		(0..word.length - 1).each do |i|
			wrd << word[i]
		end

		# adiciona a primeira letra
		@words << wrd[0]

		# adiciona as demais letras
		(1..word.length - 1).each do |i|
			aux(wrd[i])
		end
	end

	def aux(char)
		# novo array de palavras
		words = Array.new

		# cria todas as possibilidades de palavras
		@words.each do |word|
			len = word.length
			for i in (len).downto(0)
				wrd = String.new(word)
				wrd = wrd.insert(i, char)
				words << wrd
			end
		end

		# atualiza o array com todas as novas palavras
		@words = words
	end
end

shuffles = Shuffles.new("aazrboúdôslr", 8)

hash = Hash.new
#hash[6] = "l"

count = 0
shuffles.dicio.each do |word|
	if hash.empty?
		count += 1
		puts word
	else
		boolean = true
		hash.each do |k, v|
			if word[k - 1].casecmp(v) != 0
				boolean = false
				break
			end
		end

		if boolean
			count += 1
			puts word
		end
	end
end

puts "\ncount: #{count}"

# shuffles.shuffle
# puts shuffles.words

