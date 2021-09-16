require 'rubygems'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "CYBRpuZVtZ5CYEgfISmjQ412u"
  config.consumer_secret     = "lKePyZS66gkhVhr7FUXimcurzDIT1Zrn2cCDTcOLJ1ZigJmc6d"
  config.access_token        = "735118524-brGmBC8g3Q95ZU80fkfJffRozzbAM8mfbkPogvfS"
  config.access_token_secret = "tOqjr4rS66RKvAJ6fWztHXlNVB6Nf3hTQl4DvWSp82YtM"
end

if __FILE__ == $0

# client.update("I'm tweeting with @gem!")

puts client.search("#ruby -rt", :lang => "ja").first.text

client.friends.each { |e| puts e.name }


# puts client.class
# puts client.methods
# puts client.friends.first.methods

end