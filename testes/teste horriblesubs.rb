require 'open-uri'

def substr(line, str_ini, str_fim, offset)
	start  = line.index(str_ini, offset) + str_ini.length
	length = line.index(str_fim, offset) - start
	line[start, length]
end

i = 0
open('http://horriblesubs.info/shows/') do |f|
	f.each_line do |lin_01|
		if lin_01.include? '<div class="ind-show linkful">'

			href_01 = 'http://horriblesubs.info' + substr(lin_01, '<div class="ind-show linkful"><a href="', '" title="', 0)
			title = substr(lin_01, '" title="', '">', 39)

			# puts lin_01
			puts title
			puts href_01
			system('echo. >> log.txt')
			system('echo ' + title + ' >> log.txt')

			open(href_01) do |f|
				f.each_line do |lin_02|
					if lin_02.include? '<img class="size-full alignleft"'
						href_02 = substr(lin_02, '<img class="size-full alignleft" src="', '" />', 0)

						puts href_02
						system('wget "' + href_02 + '" >> log.txt')
						fname = href_02[href_02.rindex('/') + 1, href_02.index('.jpg')]
						system('mv ' + fname + ' ' + title.gsub(' ', '\ ') + '.jpg')
					end
					if lin_02.include? '<td class="rls-label">'
						cap = substr(lin_02, '<td class="rls-label">', '</td>', 0)
						system('echo ' + cap + ' >> log.txt')
					end
				end
			end
			puts ''

			i += 1
			break if i > 10
		end
	end
end
