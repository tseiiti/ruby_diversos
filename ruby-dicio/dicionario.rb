# encoding: UTF-8

system('cls')

class Word
	attr_accessor :word, :term

	def initialize (word, term)
		@word = word
		@term = term
	end
end

class Dictionary
	attr_accessor :words

	def initialize(file)
		@maxlen = 0
		@words = Array.new

		file = File.new(file, 'r:ISO-8859-1:UTF-8')
		while (line = file.gets)

			i = line.index('/')
			if i.nil?
				word = line[0, line.length - 1]
				term = ' '
			else
				word = line[0, i]
				term = line[i + 1, line.length]
			end

			len = word.length - 1
			@maxlen = len if len > @maxlen

			@words[len] = [] if @words[len].nil?
			@words[len] << Word.new(word, term)
		end
		file.close
	end
end

class Shuffles
	attr_accessor :word, :words , :dic_wrds

	def initialize (word, maxlen)
		@word = word
		@maxlen = maxlen - 1
		@words = Array.new

		# @dictionary = Dictionary.new('pt-BR.dic')
		@dictionary = Dictionary.new('teste.txt')
		# @dictionary.words[7].each { |w| puts w.word }
		@dic_wrds = Array.new
		@dictionary.words[@maxlen].each do |w|
			if Regexp.new("[" + @word + "]", Regexp::IGNORECASE).match(w.word)
				@dic_wrds << w.word
			end
		end
	end

	def shuffle
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
			# if word.length > @maxlen
			# 	len = @maxlen
			# end
			# # len = (word.length > @maxlen ? @maxlen : word.length)
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

# dictionary = Dictionary.new('pt-BR.dic')
# dictionary.words[7].each { |w| puts w.word }

# niobrcpgsaok
shuffles = Shuffles.new('niobrcpgsaok',  7)
# shuffles.shuffle
# puts shuffles.words

x = []
shuffles.dic_wrds.each do |e|
	b = true
	(0..e.length - 1).each do |i|
		if Regexp.new("[" + e[i] + "]", Regexp::IGNORECASE).match(shuffles.word)
			b = true
		else
			b = false
			break
		end
	end

	if b
		puts e
		x << e
	end
end

# (14..24).each { |e| puts e.to_s + ': '; words[e].each { |w| puts w.word } unless words[e].nil?; puts '\n' }

# p = 'léAcio'
# wds = words[p.length]
# words[5].each { |w| puts w.word + '-' + p if w.word.casecmp(p) == 0 }

# puts /[niobrcpgsaok]/.match('tavajiba')

# puts Regexp.new("[niobrcpgsaok]", Regexp::IGNORECASE).match('tavajiba')