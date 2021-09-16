require 'open-uri'

def substr(line, str_ini, str_fim, offset)
	start  = line.index(str_ini, offset) + str_ini.length
	length = line.index(str_fim, offset) - start
	line[start, length]
end

i = 0
system('echo `date` > log.txt')
open('http://horriblesubs.info/shows/') do |f|
	f.each_line do |lin_01|
		if lin_01.include? '<div class="ind-show linkful">'

			href_01 = 'http://horriblesubs.info' + substr(lin_01, '<div class="ind-show linkful"><a href="', '" title="', 0)
			title = substr(lin_01, '" title="', '">', 39)

			# next if title[0, 1].downcase =~ /[abcdefghi]/
			next if title.include? 'Stardust Crusaders Egypt Arc'

			# puts lin_01
			puts title
			puts href_01
			system('echo " " >> log.txt')
			system('echo ' + title + ' >> log.txt')
			system('echo ' + href_01 + ' >> log.txt')

			open(href_01) do |f|
				f.each_line do |lin_02|
					if lin_02.include? '<img class="size-full alignleft"'
						aux_img = lin_02[lin_02.index('<img class="size-full alignleft"'), lin_02.index('src="') - 21]
						href_02 = substr(lin_02, aux_img, '" />', 0)

						puts href_02
						system('echo ' + href_02 + ' >> log.txt')
						system('wget "' + href_02 + '" >> log.txt')
						fname = href_02[href_02.rindex('/') + 1, href_02.index('.jpg')]
						system('mv ' + fname + ' ' + title.gsub(' ', '\ ').gsub('’', '_').gsub("'", '_') + '.jpg')
					end
				end
			end
			puts ''

			i += 1
			# break if i > 25
		end
	end
end
