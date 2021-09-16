require './patterns_00.rb'

#
# 8. O Padrão Template Method
#

class CaffeineBeverageAbstract
  def initialize
    abstract
  end
  def prepareRecipe
  	boilWater
  	brew
  	pourInCup
  	if customerWantsCondiments
  		addCondiments
  	end
  end
  def brew
    interface
  end
  def addCondiments
    interface
  end
  def boilWater
  	puts "Boiling water"
  end
  def pourInCup
  	puts "Pouring into cup"
  end
	def customerWantsCondiments
		true
	end
end

class Tea < CaffeineBeverageAbstract
	def brew
		puts "Steeping the tea"
	end
	def addCondiments
		puts "Adding Lemon"
	end
	def customerWantsCondiments
		print "Would you like lemon with your tea (y/n)?"
		return gets.chomp.eql? "y"
	end
end

class Coffee < CaffeineBeverageAbstract
	def brew
		puts "Dripping Coffee through filter"
	end
	def addCondiments
		puts "Adding Sugar and Milk"
	end
	def customerWantsCondiments
		print "Would you like milk and sugar with your coffee (y/n)?"
		return gets.chomp.eql? "y"
	end
end

class Duck
	attr_accessor :weight

	def initialize(name, weight)
	  @name = name
	  @weight = weight
	end

	def to_s
		return "#{@name} weight #{@weight}"
	end

	def <=> other
		# if @weight < other.weight
		# 	return -1
		# elsif @weight == other.weight
		# 	return 0
		# else
		# 	return 1
		# end
		@weight <=> other.weight
	end
end

if __FILE__ == $0
	puts "*** Template Method Pattern ***\n\n"

	tea = Tea.new
	tea.prepareRecipe
	coffee = Coffee.new
	coffee.prepareRecipe


	puts "\n\n*** CompareTo ***\n"

	ducks = [
		Duck.new("Daffy", 8),
		Duck.new("Dewey", 2),
		Duck.new("Howard", 7),
		Duck.new("Louis", 2),
		Duck.new("Donald", 10),
		Duck.new("Huey", 2)
	]

	puts "Before sorting: "
	ducks.each{ |e| puts e }

	ducks.sort!

	puts "\n\nAfter sorting: "
	ducks.each{ |e| puts e }
end
