system("cls")

def exception
	# raise "#{self.class.name} needs to implement '#{__method__}' for interface #{self.class.superclass}"
	# raise "#{self.class.name} needs to implement '#{__callee__}' for interface #{self.class.superclass}"
	caller =~ /`([^']*)'/ and $1
	method = caller[0].split(/`/)[1].delete("'")
	raise "#{self.class.name} needs to implement method '#{method}' for interface #{self.class.superclass}"
end


# 1 Introduções aos Padrões de Projetos

class FlyBehaviorInterface
	def fly
		exception
	end
end

# classe de comportamento Fly
class FlyWithWings < FlyBehaviorInterface
	def fly
		puts "I'm flying!!"
	end
end

# classe de comportamento Fly
class FlyNoWay < FlyBehaviorInterface
	def fly
		puts "I can't fly"
	end
end

# classe de comportamento Fly
class FlyRocketPowered < FlyBehaviorInterface
	def fly
		puts "I'm flying with a rocket!"
	end
end

# interface Quack
class QuackBehaviorInterface
	def quack
		exception
	end
end

# classe de comportamento quack
class Quack < QuackBehaviorInterface
	def quack
		puts "Quack"
	end
end

# classe de comportamento quack
class MuteQuack < QuackBehaviorInterface
	def quack
		puts "<< Silence >>"
	end
end

# classe de comportamento quack
class Squeak < QuackBehaviorInterface
	def quack
		puts "Squeak"
	end
end

class DuckAbstract
	def initialize
		@flyBehavior = FlyBehaviorInterface.new
		@quackBehavior = QuackBehaviorInterface.new
		exception
	end

	def performFly
		@flyBehavior.fly
	end

	def performQuack
		@quackBehavior.quack
	end

	def setFlyBehavior(flyBehavior)
		@flyBehavior = flyBehavior
	end

	def setQuackBehavior(quackBehavior)
		@quackBehavior = quackBehavior
	end

	def swim
		puts "All ducks float, even decoys!"
	end
end

class ModelDuck < DuckAbstract
	def initialize
		@flyBehavior = FlyNoWay.new
		@quackBehavior = Quack.new
	end

	def display
		puts "I'm a model Duck"
	end
end

class MallardDuck < DuckAbstract
	def initialize
		@flyBehavior = FlyWithWings.new
		@quackBehavior = Quack.new
	end

	def display
		puts "I'm a real Mallard Duck"
	end
end

# mallard = MallardDuck.new
# mallard.performFly
# mallard.performQuack

# model = ModelDuck.new
# model.performFly
# model.setFlyBehavior(FlyRocketPowered.new)
# model.performFly





# 2 O Padrão Observer

class SubjectInterface
	def registerObserver(observer)
		exception
	end

	def removeObserver(observer)
		exception
	end

	def notifyObservers
		exception
	end
end

class DisplayElementInterface
	def display
		exception
	end
end

class ObserverInterface < DisplayElementInterface
	def update(temperature, humidity, pressure)
		exception
	end
end

class WeatherData < SubjectInterface
	def initialize
		@observers = []
	end

	def registerObserver(observer)
		@observers << observer
	end

	def removeObserver(observer)
		@observers.delete(observer)
	end

	def notifyObservers
		@observers.each { |e| e.update(@temperature, @humidity, @pressure) }
	end

	def setMeasurements(temperature, humidity, pressure)
		@temperature = temperature
		@humidity = humidity
		@pressure = pressure
		measurementsChanged
	end

	def measurementsChanged
		# temperature = getTemperature
		# humidity = getHumidity
		# pressure = getPressure
		# currentConditionsDisplay.update(temperature, humidity, pressure)
		# statisticsDisplay.update(temperature, humidity, pressure)
		# forecastDisplay.update(temperature, humidity, pressure)
		notifyObservers
	end
end

class CurrentConditionsDisplay < ObserverInterface
	def initialize(weatherData)
	  @weatherData = weatherData
	  @weatherData.registerObserver(self)
	end

	def update(temperature, humidity, pressure)
		@temperature = temperature
		@humidity = humidity
		display
	end

	def display
		puts "Current conditions: #{@temperature}F degrees and #{@humidity}% humidity"
	end
end

# weatherData = WeatherData.new
# currentDisplay = CurrentConditionsDisplay.new(weatherData)
# weatherData.setMeasurements(80, 65, 30.4)
# weatherData.setMeasurements(82, 70, 29.2)
# weatherData.setMeasurements(78, 90, 29.2)





# 3 O Padrão Decorator
class BeverageAbstract
	def initialize
	  @description = "Unknown Beverage"
	  exception
	end

	def getDescription
		@description
	end

	def cost
		exception
	end
end

class CondimentDecoratorAbstract < BeverageAbstract
	def initialize
	  exception
	end

	def getDescription
		exception
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


# beverage = Expresso.new
# puts beverage.getDescription + " $" + beverage.cost.to_s

# beverage2 = DarkRoast.new
# beverage2 = Mocha.new(beverage2)
# beverage2 = Mocha.new(beverage2)
# puts beverage2.getDescription + " $" + beverage2.cost.to_s

# beverage3 = Whip.new(Mocha.new(Soy.new(HouseBlend.new)))
# puts beverage3.getDescription + " $" + beverage3.cost.to_s





# 4 O Padrão Factory
class PizzaStoreAbstract
	def initialize
	  exception
	end

	def orderPizza(type)
		pizza = createPizza(type)
		pizza.prepare
		pizza.bake
		pizza.cut
		pizza.box
	end

	def createPizza
		exception
	end
end

class NYPizzaStore < PizzaStoreAbstract
	def createPizza

	end
end

class ChicagoPizzaStore < PizzaStoreAbstract

	def createPizza

	end
end

class SimplePizzaFactory
	def self.createPizza(type)
		if type.downcase == "cheese"
			return CheesePizza.new
		elsif type.downcase == "pepperoni"
			return PepperoniPizza.new
		elsif type.downcase == "clam"
			return ClamPizza.new
		elsif type.downcase == "veggie"
			return VeggiePizza.new
		end
	end
end

class PizzaAbstract
	def initialize(name)
	  @name = name
		@toppings = []
	end

	def orderPizza
		exception
	end

	def prepare
		puts "Preparing #{@name}"
		puts "Tossing dough..."
		puts "Adding sauce..."
		puts "Adding toppings:"
		#@toppings.each { |t| puts "  #{t}" }
	end

	def bake
		puts "Bake for 25 minutes at 350"
	end

	def cut
		puts "Cutting the pizza into diagonal slices"
	end

	def box
		puts "Place pizza in official PizzaStore box"
	end
end

class CheesePizza
end

class VeggiePizza
end

class ClamPizza
end


class PepperoniPizza
end