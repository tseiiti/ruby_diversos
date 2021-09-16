system('cls')

counter = 1
begin
	file = File.new("pt-BR.dic", "r")
	while (line = file.gets)

		i = line.index('/')
		if i.nil?
			palavra = line
			parametro = " "
		else
			palavra = line[0, i]
			parametro = line[i + 1, 99]
		end

		puts palavra + " | " + parametro

		counter = counter + 1
		break if counter > 100
	end
	file.close
rescue => err
	puts "Exception: #{err}"
	err
end

puts counter