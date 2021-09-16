require './patterns_00.rb'

#
# 1. Introduções aos Padrões de Projetos
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

if __FILE__ == $0
	puts "*** Behavior Pattern ***\n\n"

	mallard = MallardDuck.new
	mallard.performFly
	mallard.performQuack

	model = ModelDuck.new
	model.performFly
	model.setFlyBehavior(FlyRocketPowered.new)
	model.performFly
end