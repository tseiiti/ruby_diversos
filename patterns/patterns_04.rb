require './patterns_00.rb'

#
# 4. O Padrão Factory
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

if __FILE__ == $0
	puts "*** Factory Pattern ***\n\n"

	nyStore = NYPizzaStore.new
	chicagoStore = ChicagoPizzaStore.new
	pizza = nyStore.orderPizza("cheese")
	puts "Ethan ordered a " + pizza.getName + "\n\n"
	pizza = chicagoStore.orderPizza("cheese")
	puts "Joel ordered a " + pizza.getName + "\n\n"

	pizza = nyStore.orderPizza("pepperoni")
	puts "Ethan ordered a " + pizza.getName + "\n\n"
	pizza = chicagoStore.orderPizza("pepperoni")
	puts "Joel ordered a " + pizza.getName + "\n\n"

	pizza = nyStore.orderPizza("clam")
	puts "Ethan ordered a " + pizza.getName + "\n\n"
	pizza = chicagoStore.orderPizza("clam")
	puts "Joel ordered a " + pizza.getName + "\n\n"

	pizza = nyStore.orderPizza("veggie")
	puts "Ethan ordered a " + pizza.getName + "\n\n"
	pizza = chicagoStore.orderPizza("veggie")
	puts "Joel ordered a " + pizza.getName + "\n\n"
end