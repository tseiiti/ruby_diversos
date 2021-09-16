require 'open-uri'
require 'nokogiri'
system('cls')

def inicia
	@table = [] # tabela
	@table << [] # colunas
	@linha = 0

	@table[0] << "Modelo"
	@table[0] << "Sistema Operacional"
	@table[0] << "Disponibilidade"
	@table[0] << "Dimensões"
	@table[0] << "Peso"
	@table[0] << "MELHOR PREÇO"
	@table[0] << "Faixa de Preço"
	@table[0] << "Custo-benefício"
	@table[0] << "Hardware"
	@table[0] << "- Tela"
	@table[0] << "- Câmera"
	@table[0] << "- Desempenho"
	@table[0] << "Gsm"
	@table[0] << "Dual Sim"
	@table[0] << "Sim Card"
	@table[0] << "Chipset"
	@table[0] << "Processador"
	@table[0] << "64 Bit"
	@table[0] << "GPU"
	@table[0] << "RAM"
	@table[0] << "Memória Max"
	@table[0] << "Memória Expansível"
	@table[0] << "Polegadas"
	@table[0] << "Resolução"
	@table[0] << "Densidade de pixels"
	@table[0] << "Tipo"
	@table[0] << "Touchscreen"
	@table[0] << "Multitouch"
	@table[0] << "Cores"
	@table[0] << "Megapixel"
	@table[0] << "Resolução"
	@table[0] << "Estabilização"
	@table[0] << "Autofoco"
	@table[0] << "Foco por toque"
	@table[0] << "Flash"
	@table[0] << "HDR"
	@table[0] << "Localização"
	@table[0] << "Câmera Frontal"
	@table[0] << "Resolução da gravação"
	@table[0] << "FPS da gravação"
	@table[0] << "Stereo Sound Rec"
	@table[0] << "Wi-Fi"
	@table[0] << "Bluetooth"
	@table[0] << "USB"
	@table[0] << "NFC"
	@table[0] << "GPS"
	@table[0] << "GPRS"
	@table[0] << "EDGE"
	@table[0] << "UMTS"
	@table[0] << "HSDPA"
	@table[0] << "HSUPA"
	@table[0] << "HSPA+"
	@table[0] << "LTE"
	@table[0] << "Velocidade máxima de download"
	@table[0] << "Velocidade máxima de upload"
	@table[0] << "Acelerômetro"
	@table[0] << "Proximidade"
	@table[0] << "Player de música"
	@table[0] << "Player de vídeo"
	@table[0] << "Radio FM"
	@table[0] << "Tv"
	@table[0] << "Saída de TV"
	@table[0] << "Browser"
	@table[0] << "Flash Player"
	@table[0] << "Vibração"
	@table[0] << "Viva Voz"
	@table[0] << "Toques"
	@table[0] << "Toques personalizados"
	@table[0] << "Outros"
	@table[0] << "Tipo"
	@table[0] << "Autonomia conversação"
	@table[0] << "Autonomia em standby"
	@table[0] << "Ampere"
	@table[0] << "SAR EU"
end

def insere_linha
		@linha += 1
		@table << []
		@table[0].length.times { |i| @table[@linha] << []}
end

def auxiliar(html)
	doc = Nokogiri::HTML(open(html))

	feat = [] # tabela
	feat << [] # colunas
	feat << [] # linha

	# nome do modelo
	feat[0] << "Modelo"
	feat[1] << doc.css("h2").text

	# nomes das colunas
	div = doc.css("div.row_titles")
	div.css("ul.phone_column_features").each do |ul|
		ul.css("li").each do |li|
			feat[0] << li.text
		end
	end

	# valores das linhas
	div = doc.css("div#phone_columns")
	div.css("ul.phone_column_features").each do |ul|
		ul.css("li").each do |li|
			t = ""
			t = "ok" if li.at_css("i.ok")
			t =  "X" if li.at_css("i.wrong")
			feat[1] << (t.empty? || li.text.empty? ? t + li.text : t + ' ' + li.text)
		end
	end

	feat
end

def executa(html)
	articles = Nokogiri::Slop(open(html))
			.html
			.body
			.div("[@id='main_container']")
			.section("[@id='cel_list']")
			.div("[@id='cellphones_list']")
			.article

	# para cada página uma nova pesquisa
	articles.each do |article|
		feat = auxiliar(@root + article.a['href'])

		tipo = 1
		insere_linha
		feat[0].length.times do |i|
			# puts feat[0][i] + ': ' + feat[1][i]

			if feat[0][i] == "Tipo" && tipo == 1
				coluna = 25
				tipo = 2
			elsif feat[0][i] == "Tipo" && tipo == 2
				coluna = 69
			else
				coluna = @table[0].index(feat[0][i])
			end

			if coluna.nil?
				@table[0] << feat[0][i]
				@table[@linha] << feat[1][i].gsub('"','')
			else
				@table[@linha][coluna] = feat[1][i].gsub('"','')
			end
		end

		# break if @table.count == 10
	end
end


inicia

# https://www.tudocelular.com/celulares/fichas-tecnicas_3.html?o=2

@root = "https://www.tudocelular.com"

1.times do |i|
	executa(@root + "/celulares/fichas-tecnicas_#{i+1}.html")
end

@table.length.times do |lin|
	puts '"' + @table[lin].join('";"') + '"'
end