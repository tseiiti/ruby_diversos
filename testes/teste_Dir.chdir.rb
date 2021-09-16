system('cls')

def mostra(path)
	Dir.chdir(path)
	Dir.glob('*').select { |f| 
		p = path + '/' + f
		if File.directory? p
			mostra(p) if File.exist? p
		else
			puts f + ' ' + (File.size p).to_s
		end
	}
end

mostra("D:/Music")