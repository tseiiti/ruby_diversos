require './patterns_00.rb'

#
# 3. O Padrão Decorator
#

class BeverageAbstract
  def initialize
    @description = "Unknown Beverage"

    # indica que é um classe abstrata
    abstract
  end
  def getDescription
    @description
  end
  def cost
    interface
  end
end

class CondimentDecoratorAbstract < BeverageAbstract
  def initialize
    abstract
  end
  def getDescription
    interface
  end
end

class Expresso < BeverageAbstract
  def initialize
    @description = "Expresso"
  end
  def cost
    1.99
  end
end

class DarkRoast < BeverageAbstract
  def initialize
    @description = "Dark Roast Coffee"
  end
  def cost
    0.99
  end
end

class Decaf < BeverageAbstract
  def initialize
    @description = "Decafeinad Coffee"
  end
  def cost
    1.05
  end
end

class HouseBlend < BeverageAbstract
  def initialize
    @description = "House Blend Coffee"
  end
  def cost
    0.89
  end
end

class Mocha < CondimentDecoratorAbstract
  def initialize(beverage)
    @beverage = beverage
  end
  def getDescription
    @beverage.getDescription + ", Mocha"
  end
  def cost
    0.20 + @beverage.cost
  end
end

class Whip < CondimentDecoratorAbstract
  def initialize(beverage)
    @beverage = beverage
  end
  def getDescription
    @beverage.getDescription + ", Whip"
  end
  def cost
    0.10 + @beverage.cost
  end
end

class Soy < CondimentDecoratorAbstract
  def initialize(beverage)
    @beverage = beverage
  end
  def getDescription
    @beverage.getDescription + ", Soy"
  end
  def cost
    0.15 + @beverage.cost
  end
end

class Milk < CondimentDecoratorAbstract
  def initialize(beverage)
    @beverage = beverage
  end
  def getDescription
    @beverage.getDescription + ", Milk"
  end
  def cost
    0.10 + @beverage.cost
  end
end

if __FILE__ == $0
	puts "*** Decorator Pattern ***\n\n"

	beverage = Expresso.new
	puts beverage.getDescription + " $" + beverage.cost.to_s

	beverage2 = DarkRoast.new
	beverage2 = Mocha.new(beverage2)
	beverage2 = Mocha.new(beverage2)
	puts beverage2.getDescription + " $" + beverage2.cost.to_s

	beverage3 = Whip.new(Mocha.new(Soy.new(HouseBlend.new)))
	puts beverage3.getDescription + " $" + beverage3.cost.to_s
end