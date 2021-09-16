# encoding: utf-8
require './patterns_00.rb'

#
# 5. O Padrão Singleton
#

class ChocolateBoiler
  def self.getInstance
    Mutex.new.synchronize {
      if @uniqueInstance.nil?
        @uniqueInstance = ChocolateBoiler.new
      end
      @uniqueInstance
    }
  end
  def fill
    if isEmpty
      @empty = false
      @boiled = false
      simulate "preencha a caldeira com uma mistura de leite e chocolate"
    end
  end
  def drain
    if !isEmpty && isBoiled
      simulate "drene o leite e o chocolate fervidos"
      @empty = true
    end
  end
  def boil
    if !isEmpty && !isBoiled
      simulate "coloque o conteúdo em ebulição"
      @boiled = true
    end
  end
  def isEmpty
    @empty
  end
  def isBoiled
    @boiled
  end

  private
  def initialize
    @empty = true
    @boiled = false
    # @mutex = Mutex.new
    # @uniqueInstance = ChocolateBoiler.new
  end
  def simulate(texto)
    texto.each_char { |c|
      print c
      sleep 0.03
    }

    (3 + rand(10)).times {
      sleep 0.2
      print "."
    }
    puts ""
  end
end

if __FILE__ == $0
	puts "*** Singleton Pattern ***\n\n"

	cb = ChocolateBoiler.getInstance
	cb.fill
	cb.boil
	cb.drain
end