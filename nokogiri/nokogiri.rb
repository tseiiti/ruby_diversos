require 'open-uri'
require 'nokogiri'

html = "https://www.zoom.com.br/notebook/todos"
@doc = Nokogiri::HTML(open(html)) do |config|
  config.strict.nonet
end

system('cls')
#puts @doc
puts @doc.xpath("//li")