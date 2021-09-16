# encoding: utf-8
system("cls")

# obriga e implementação do método na classe derivada
def interface
  caller =~ /`([^']*)'/ and $1
  method = caller[0].split(/`/)[1].delete("'")
  error = "#{self.class.name} needs to implement '#{method}' "
  error += "method for interface #{self.class.superclass}"
  raise NotImplementedError.new(error)
end

# impede a instaciação da classe
def abstract
  if self.class.name =~ /Abstract/
    error = "Abstract class #{self.class.name} "
    error += "can't instantiate an object"
    raise error
  end
end




#
# 1 Introduções aos Padrões de Projetos
#

class FlyBehaviorInterface
  def fly
    # indica que é um método de interface
    interface
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
    interface
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

# classe abstrata Duck
class DuckAbstract
  def initialize
    @flyBehavior = FlyBehaviorInterface.new
    @quackBehavior = QuackBehaviorInterface.new

    # indica que é um classe abstrata
    abstract
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

# classe concreta Model Duck
class ModelDuck < DuckAbstract
  def initialize
    @flyBehavior = FlyNoWay.new
    @quackBehavior = Quack.new
  end
  def display
    puts "I'm a model Duck"
  end
end

# classe concreta Mallard Duck
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




#
# 2 O Padrão Observer
#

# interface sujeito que notifica as mudanças aos observadores
class SubjectInterface
  def registerObserver(observer)
    interface
  end
  def removeObserver(observer)
    interface
  end
  def notifyObservers
    interface
  end
end

# classe concreta sujeito
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

class DisplayElementInterface
  def display
    interface
  end
end

class ObserverInterface < DisplayElementInterface
  def update(temperature, humidity, pressure)
    interface
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




#
# 3 O Padrão Decorator
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

# beverage = Expresso.new
# puts beverage.getDescription + " $" + beverage.cost.to_s

# beverage2 = DarkRoast.new
# beverage2 = Mocha.new(beverage2)
# beverage2 = Mocha.new(beverage2)
# puts beverage2.getDescription + " $" + beverage2.cost.to_s

# beverage3 = Whip.new(Mocha.new(Soy.new(HouseBlend.new)))
# puts beverage3.getDescription + " $" + beverage3.cost.to_s




#
# 4 O Padrão Factory
#

class IngredientInterface
end
class DoughInterface < IngredientInterface
end
class ThickCrustDough < DoughInterface
  def getName
    "Extra Thick Crust Dough"
  end
end
class ThinCrustDough < DoughInterface
  def getName
    "Thin Crust Dough"
  end
end
class SauceInterface < IngredientInterface
end
class PlumTomatoSauce < SauceInterface
  def getName
    "Plum Tomato Sauce"
  end
end
class MarinaraSauce < SauceInterface
  def getName
    "Marinara Sauce"
  end
end
class CheeseInterface < IngredientInterface
end
class MozzarellaCheese < CheeseInterface
  def getName
    "Shredded Mozzarella Cheese"
  end
end
class ReggianoCheese < CheeseInterface
  def getName
    "Grated Reggiano Cheese"
  end
end
class ClamInterface < IngredientInterface
end
class FrozenClam < ClamInterface
  def getName
    "Frozen Clam"
  end
end
class FreshClam < ClamInterface
  def getName
    "Fresh Clam"
  end
end
class Garlic
  def getName
    "Garlic"
  end
end
class Onion
  def getName
    "Onion"
  end
end
class Mushroom
  def getName
    "Mushroom"
  end
end
class RedPepper
  def getName
    "Red Pepper"
  end
end
class SlicedPepperoni
  def getName
    "Sliced Pepperoni"
  end
end

class PizzaIngredientFactoryInterface
  def createDough
    interface
  end
  def createSauce
    interface
  end
  def createCheese
    interface
  end
  def createVeggies
    interface
  end
  def createPepperoni
    interface
  end
  def createClam
    interface
  end
end

class NYPizzaIngredientFactory < PizzaIngredientFactoryInterface
  def createDough
    ThinCrustDough.new
  end
  def createSauce
    MarinaraSauce.new
  end
  def createCheese
    ReggianoCheese.new
  end
  def createVeggies
    [ Garlic.new, Onion.new, Mushroom.new, RedPepper.new ]
  end
  def createPepperoni
    SlicedPepperoni.new
  end
  def createClam
    FreshClam.new
  end
end

class ChicagoPizzaIngredientFactory < PizzaIngredientFactoryInterface
  def createDough
    ThickCrustDough.new
  end
  def createSauce
    PlumTomatoSauce.new
  end
  def createCheese
    MozzarellaCheese.new
  end
  def createVeggies
    [ Garlic.new, Onion.new, Mushroom.new, RedPepper.new ]
  end
  def createPepperoni
    SlicedPepperoni.new
  end
  def createClam
    FrozenClam.new
  end
end

class PizzaAbstract
  def initialize
    abstract
  end
  def getName
    @name
  end
  def setName(name)
    @name = name
  end
  def prepare
    interface
  end
  def aux_prepare
    puts "Preparing #{@name}"
    puts "Tossing dough #{@dough.getName}"
    puts "Adding sauce #{@sauce.getName}"
    puts "Adding toppings:"
    @toppings.each { |t| puts "  #{t}" }
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

class CheesePizza < PizzaAbstract
  def initialize(ingredientFactory)
    @ingredientFactory = ingredientFactory
  end
  def prepare
    @dough 		= @ingredientFactory.createDough
    @sauce 		= @ingredientFactory.createSauce
    @cheese 	= @ingredientFactory.createCheese
    @toppings = []
    @toppings << @cheese.getName
    aux_prepare
  end
end

class VeggiePizza < PizzaAbstract
  def initialize(ingredientFactory)
    @ingredientFactory = ingredientFactory
  end
  def prepare
    @dough 		= @ingredientFactory.createDough
    @sauce 		= @ingredientFactory.createSauce
    @veggies 	= @ingredientFactory.createVeggies
    @toppings = []
    @veggies.each { |veggie| @toppings << veggie.getName }
    aux_prepare
  end
end

class ClamPizza < PizzaAbstract
  def initialize(ingredientFactory)
    @ingredientFactory = ingredientFactory
  end
  def prepare
    @dough 		= @ingredientFactory.createDough
    @sauce 		= @ingredientFactory.createSauce
    @cheese 	= @ingredientFactory.createCheese
    @clam 		= @ingredientFactory.createClam
    @toppings = []
    @toppings << @cheese.getName
    @toppings << @clam.getName
    aux_prepare
  end
end

class PepperoniPizza < PizzaAbstract
  def initialize(ingredientFactory)
    @ingredientFactory = ingredientFactory
  end
  def prepare
    @dough 			= @ingredientFactory.createDough
    @sauce 			= @ingredientFactory.createSauce
    @cheese 		= @ingredientFactory.createCheese
    @pepperoni 	= @ingredientFactory.createPepperoni
    @toppings 	= []
    @toppings << @cheese.getName
    @toppings << @pepperoni.getName
    aux_prepare
  end
end

class PizzaStoreAbstract
  def initialize
    abstract
  end
  def orderPizza(type)
    pizza = createPizza(type)
    pizza.prepare
    pizza.bake
    pizza.cut
    pizza.box

    pizza
  end
  def createPizza(type)
    interface
  end
end

class NYPizzaStore < PizzaStoreAbstract
  def initialize
    @ingredientFactory = NYPizzaIngredientFactory.new
  end
  def createPizza(type)
    type = type.downcase
    pizza = nil
    if type == "cheese"
      pizza = CheesePizza.new(@ingredientFactory)
      pizza.setName("NY Style Sauce and Cheese Pizza")
    elsif type == "pepperoni"
      pizza = PepperoniPizza.new(@ingredientFactory)
      pizza.setName("NY Style Pepperoni Pizza")
    elsif type == "clam"
      pizza = ClamPizza.new(@ingredientFactory)
      pizza.setName("NY Style Fresh Clam Pizza")
    elsif type == "veggie"
      pizza = VeggiePizza.new(@ingredientFactory)
      pizza.setName("NY Style Veggies Pizza")
    end
    pizza
  end
end

class ChicagoPizzaStore < PizzaStoreAbstract
  def initialize
    @ingredientFactory = ChicagoPizzaIngredientFactory.new
  end
  def createPizza(type)
    type = type.downcase
    pizza = nil
    if type == "cheese"
      pizza = CheesePizza.new(@ingredientFactory)
      pizza.setName("Chicago Style Deep Dish Cheese Pizza")
    elsif type == "pepperoni"
      pizza = PepperoniPizza.new(@ingredientFactory)
      pizza.setName("Chicago Style Pepperoni Pizza")
    elsif type == "clam"
      pizza = ClamPizza.new(@ingredientFactory)
      pizza.setName("Chicago Style Clam Pizza")
    elsif type == "veggie"
      pizza = VeggiePizza.new(@ingredientFactory)
      pizza.setName("Chicago Style Veggies Pizza")
    end
    pizza
  end
end

# nyStore = NYPizzaStore.new
# chicagoStore = ChicagoPizzaStore.new
# pizza = nyStore.orderPizza("cheese")
# puts "Ethan ordered a " + pizza.getName + "\n\n"
# pizza = chicagoStore.orderPizza("cheese")
# puts "Joel ordered a " + pizza.getName + "\n\n"

# pizza = nyStore.orderPizza("pepperoni")
# puts "Ethan ordered a " + pizza.getName + "\n\n"
# pizza = chicagoStore.orderPizza("pepperoni")
# puts "Joel ordered a " + pizza.getName + "\n\n"

# pizza = nyStore.orderPizza("clam")
# puts "Ethan ordered a " + pizza.getName + "\n\n"
# pizza = chicagoStore.orderPizza("clam")
# puts "Joel ordered a " + pizza.getName + "\n\n"

# pizza = nyStore.orderPizza("veggie")
# puts "Ethan ordered a " + pizza.getName + "\n\n"
# pizza = chicagoStore.orderPizza("veggie")
# puts "Joel ordered a " + pizza.getName + "\n\n"






#
# 5 O Padrão Singleton
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

# cb = ChocolateBoiler.getInstance
# cb.fill
# cb.boil
# cb.drain





#
# 6 O Padrão Command
#

class Light
  def initialize(room)
    @room = room
  end
  def on
    puts "#{@room} light is on"
  end
  def off
    puts "#{@room} light is off"
  end
end
class CeilingFan
  OFF = 0
  LOW = 1
  MEDIUM = 2
  HIGH = 3

  # @@speed = { 0 => "off", 1 => "low", 2 => "medium", 3 => "high" }

  def initialize(room)
    @room = room
    @speed = OFF
  end

  # def on(speed)
  # 	puts "#{@room} ceiling fan is on #{@@speed[speed]}"
  # end
  def high
    @speed = HIGH
    puts "#{@room} ceiling fan is on high"
  end
  def medium
    @speed = MEDIUM
    puts "#{@room} ceiling fan is on medium"
  end
  def low
    @speed = LOW
    puts "#{@room} ceiling fan is on low"
  end
  def off
    puts "#{@room} ceiling fan is off"
  end
  def getSpeed
    @speed
  end
end
class GarageDoor
  def initialize(room)
    @room = room
  end
  def up
    puts "#{@room} garage door up"
  end
  def down
    puts "#{@room} garage door down"
  end
end
class Stereo
  def initialize(room)
    @room = room
  end
  def on
    puts "#{@room} stereo is on"
  end
  def setCD
    puts "#{@room} stereo is set for CD input"
  end
  def setVolume(vol)
    puts "#{@room} stereo volume set to #{vol}"
  end
  def off
    puts "#{@room} stereo is off"
  end
end

class CommandInterface
  def execute
    interface
  end
  def undo
    interface
  end
end

class LightOnCommand < CommandInterface
  def initialize(light)
    @light = light
  end
  def execute
    @light.on
  end
  def undo
    @light.off
  end
end

class LightOffCommand < CommandInterface
  def initialize(light)
    @light = light
  end
  def execute
    @light.off
  end
  def undo
    @light.on
  end
end

class CeilingFanOnCommand < CommandInterface
  def initialize(ceilingFan)
    @ceilingFan = ceilingFan
  end
  def execute
    @prevSpeed = @ceilingFan.getSpeed
    @ceilingFan.high
  end
  def undo
    case @prevSpeed
    when CeilingFan::HIGH
      @ceilingFan.high
    when CeilingFan::MEDIUM
      @ceilingFan.medium
    when CeilingFan::LOW
      @ceilingFan.low
    else
      @ceilingFan.off
    end
  end
end

class CeilingFanHighCommand < CeilingFanOnCommand
  def execute
    @prevSpeed = @ceilingFan.getSpeed
    @ceilingFan.high
  end
end

class CeilingFanMediumCommand < CeilingFanOnCommand
  def execute
    @prevSpeed = @ceilingFan.getSpeed
    @ceilingFan.medium
  end
end

class CeilingFanOffCommand < CommandInterface
  def initialize(ceilingFan)
    @ceilingFan = ceilingFan
  end
  def execute
    @prevSpeed = @ceilingFan.getSpeed
    @ceilingFan.off
  end
  def undo
    case @prevSpeed
    when CeilingFan::HIGH
      @ceilingFan.high
    when CeilingFan::MEDIUM
      @ceilingFan.medium
    when CeilingFan::LOW
      @ceilingFan.low
    else
      @ceilingFan.off
    end
  end
end

class GarageDoorUpCommand < CommandInterface
  def initialize(garageDoor)
    @garageDoor = garageDoor
  end
  def execute
    @garageDoor.up
  end
end

class GarageDoorDownCommand < CommandInterface
  def initialize(garageDoor)
    @garageDoor = garageDoor
  end
  def execute
    @garageDoor.down
  end
end

class StereoOnWithCDCommand < CommandInterface
  def initialize(stereo)
    @stereo = stereo
  end
  def execute
    @stereo.on
    @stereo.setCD
    @stereo.setVolume(11)
  end
end

class StereoOffWithCDCommand < CommandInterface
  def initialize(stereo)
    @stereo = stereo
  end
  def execute
    @stereo.off
  end
end

class NoCommand < CommandInterface
  def execute
  end
end

class RemoteControl
  def initialize
    @onCommands = []
    @offCommands = []
    @undoCommand = NoCommand.new

    7.times {
      @onCommands << NoCommand.new
      @offCommands << NoCommand.new
    }
  end
  def setCommand(slot, onCommand, offCommand)
    @onCommands[slot] = onCommand
    @offCommands[slot] = offCommand
  end
  def onButtonWasPressed(slot)
    @onCommands[slot].execute
    @undoCommand = @onCommands[slot]
  end
  def offButtonWasPressed(slot)
    @offCommands[slot].execute
    @undoCommand = @offCommands[slot]
  end
  def undoButtonWasPressed
    @undoCommand.undo
  end
  def to_s
    t = "\n----- Remote Control -----\n"
    (0...7).each { |index|
      t += "[slot #{index.to_s}] #{@onCommands[index].class.name}"
      t += "\t" unless @onCommands[index].class.name.length > 18
      t += "\t#{@offCommands[index].class.name}\n"
    }
    t += "[undo  ] #{@undoCommand.class.name}\n\n"
  end
end

# livingRoomLight = Light.new("Living Room")
# kitchenLight = Light.new("Kitchen")
# ceilingFan = CeilingFan.new("Living Room")
# garageDoor = GarageDoor.new("")

# remote = RemoteControl.new
# remote.setCommand(0, LightOnCommand.new(livingRoomLight), LightOffCommand.new(livingRoomLight))
# remote.setCommand(1, LightOnCommand.new(kitchenLight), LightOffCommand.new(kitchenLight))
# remote.setCommand(2, CeilingFanOnCommand.new(ceilingFan), CeilingFanOffCommand.new(ceilingFan))
# remote.setCommand(3, GarageDoorUpCommand.new(garageDoor), GarageDoorDownCommand.new(garageDoor))
# remote.setCommand(4, CeilingFanHighCommand.new(ceilingFan), CeilingFanOffCommand.new(ceilingFan))
# remote.setCommand(5, CeilingFanMediumCommand.new(ceilingFan), CeilingFanOffCommand.new(ceilingFan))

# puts remote
# remote.onButtonWasPressed(0)
# remote.offButtonWasPressed(0)
# remote.undoButtonWasPressed
# remote.onButtonWasPressed(1)
# remote.offButtonWasPressed(1)
# remote.onButtonWasPressed(2)
# remote.offButtonWasPressed(2)
# remote.onButtonWasPressed(3)
# remote.offButtonWasPressed(3)


# remote.onButtonWasPressed(4)
# remote.offButtonWasPressed(4)
# remote.undoButtonWasPressed

# remote.onButtonWasPressed(5)
# remote.offButtonWasPressed(5)
# remote.undoButtonWasPressed
# remote.onButtonWasPressed(4)
# remote.undoButtonWasPressed





#
# 7 O Padrão Adapter
#
class TurkeyInterface
  def gobble
    interface
  end
  def fly
    interface
  end
end

class WildTurkey < TurkeyInterface
  def gobble
    puts "Gobble gobble"
  end
  def fly
    puts "I'm flyng a short distance"
  end
end

class TurkeyAdapter < DuckAbstract
  def initialize(turkey)
    @turkey = turkey
  end
  def performQuack
    @turkey.gobble
  end
  def performFly
    5.times { @turkey.fly }
  end
end

mallard = MallardDuck.new
mallard.performFly
mallard.performQuack

turkeyAdapter = TurkeyAdapter.new(WildTurkey.new)
turkeyAdapter.performQuack
turkeyAdapter.performFly

