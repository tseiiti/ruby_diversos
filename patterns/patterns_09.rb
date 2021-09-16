require './patterns_00.rb'

#
# 9. Os Padrões Iterator e Composite
#

class MenuComponentAbstract
	attr_accessor :name, :description, :vegetarian, :price

	def initialize(name, description, vegetarian, price)
	  @name = name
	  @description = description
		@vegetarian = vegetarian
		@price = price

    abstract
	end

	def add
		interface
	end

	def remove
		interface
	end

	def getChild(i)
		interface
	end

	def print
		interface
	end
end

class Menu < MenuComponentAbstract
	def initialize(name, description)
	  @name = name
	  @description = description

		@menuComponents = []
	end

	def add(menuComponent)
		@menuComponents << menuComponent
	end

	def remove(menuComponent)
		@menuComponents.delete(menuComponent)
	end

	def print
		puts "\n#{@name}, #{@description}"
		puts "--------------------------------"

		@menuComponents.each{ |menuComponent| menuComponent.print }
	end

	def createIterator
		CompositeIterator.new(@menuComponents)
	end
end

class MenuItem < MenuComponentAbstract
	def print
		puts "  #{@name} " + (@vegetarian ? "(v)" : "") + ", #{@price}\n    -- #{@description}"
	end

	def createIterator
		NullIterator.new
	end
end

class CompositeIterator
	def initialize(iterator)
	  @stack = iterator
	end

	def next
		iterator = @stack.shift
		i = iterator.createIterator
		while i.hasNext
			@stack.push(i.next)
		end
		iterator
	end

	def hasNext
		!@stack.empty?
	end

	def remove
		raise NotImplementedError.new("Not implemented")
	end
end

class NullIterator
	def next
		nil
	end

	def hasNext
		false
	end

	def remove
		raise NotImplementedError.new("Not implemented")
	end
end

class Waitress
	def initialize(allMenus) #(pancakeHouseMenu, dinerMenu, cafeMenu)
	  # @pancakeHouseMenu = pancakeHouseMenu
	  # @dinerMenu = dinerMenu
	  # @cafeMenu = cafeMenu

	  @allMenus = allMenus
	end

	def printMenu
		# puts "MENU\n----\nBREAKFAST"
		# print(@pancakeHouseMenu.createIterator)
		# puts "\nLUNCH"
		# print(@dinerMenu.createIterator)
		# puts "\nDINNER"
		# print(@cafeMenu.createIterator)

		# @menu.each { |e| print e.createIterator }
		@allMenus.print
	end

	def printVegetarianMenu
		iterator = @allMenus.createIterator

		puts "\nVEGETARIAN MENU\n---------------"
		while iterator.hasNext
			begin
				i = iterator.next
				if i.vegetarian
					i.print
				end
			rescue Exception => e
			end
		end
	end

# private
# 	def print(iterator)
# 		while iterator.hasNext
# 			menuItem = iterator.next
# 			puts "#{menuItem.name}, #{menuItem.price} -- #{menuItem.description}"
# 		end
# 	end
end

if __FILE__ == $0
	puts "*** Iterator and Composite Pattern ***\n\n"

	# waitress = Waitress.new(PancakeHouseMenu.new, DinerMenu.new, CafeMenu.new)
	# waitress = Waitress.new([PancakeHouseMenu.new, DinerMenu.new, CafeMenu.new])
	# waitress.printMenu

	pancakeHouseMenu = Menu.new("PANCAKE HOUSE MENU", "Lunch")
	dinerMenu = Menu.new("DINER MENU", "Dinner")
	cafeMenu = Menu.new("CAFE MENU", "Breakfast")
	dessertMenu = Menu.new("DESSERT MENU", "Dessert of  course")
	allMenus = Menu.new("ALL MENUS", "All menus combined")

	pancakeHouseMenu.add(MenuItem.new("K&B's Pancake Breakfast", "Pancakes with scrambled eggs, and toast", true, 2.99))
	pancakeHouseMenu.add(MenuItem.new("Regular Pancake Breakfast", "Pancakes with fried eggs, sausage", false, 2.99))
	pancakeHouseMenu.add(MenuItem.new("Blueberry Pancakes", "Pancakes made with fresh blueberries", true, 3.49))
	pancakeHouseMenu.add(MenuItem.new("Waffles", "Waffles with your choice of blueberries or strawberries", true, 3.59))

	dinerMenu.add(MenuItem.new("Vegetarian BLT", "(Fakin') Bacon with lettuce & tomato on whole wheat", true, 2.99))
	dinerMenu.add(MenuItem.new("BLT", "Bacon with lettuce & tomato on whole wheat", false, 2.99))
	dinerMenu.add(MenuItem.new("Soup of the day", "Soup of the day, with a side of potato salad", false, 3.29))
	dinerMenu.add(MenuItem.new("Hotdog", "A hot dog, with saurkraut, relish, onios, topped with cheese", false, 3.05))
	dinerMenu.add(MenuItem.new("Steamed Veggies and Brown Rice", "Steamed vegetables over brown rice", true, 3.99))
	dinerMenu.add(MenuItem.new("Pasta", "Spaghetti with Marinara Sauce, and a slice of sourdugh bread", false, 3.89))

	cafeMenu.add(MenuItem.new("Veggies Burger and Air Fries ", "Veggies burger on a whole wheat bun, lettuce, tomato and fries", true, 3.99))
	cafeMenu.add(MenuItem.new("Soup of the day", "A cup of soup of the day, with a side salad", false, 3.69))
	cafeMenu.add(MenuItem.new("Burrito", "A large burrito, with whole pint beans, salsa, guacamole", true, 4.29))

	dessertMenu.add(MenuItem.new("Apple Pie", "Apple pie with a flakey  crust, topped with vanilla ice cream", true, 1.59))
	dessertMenu.add(MenuItem.new("Cheesecake", "Creamy New York cheesecake, with a chocolate graham crust", true, 1.99))
	dessertMenu.add(MenuItem.new("Sorbet", "A scoop of raspberry and a scoop of lime", true, 1.89))

	dinerMenu.add(dessertMenu)

	allMenus.add(cafeMenu)
	allMenus.add(pancakeHouseMenu)
	allMenus.add(dinerMenu)

	waitress = Waitress.new(allMenus)
	# waitress.printMenu
	waitress.printVegetarianMenu
end




# class Menu
# 	def createIterator
# 		interface
# 	end
# end

# class PancakeHouseMenu < Menu
# 	def initialize
# 		@menuItems = Array.new
# 		addItem("K&B's Pancake Breakfast", "Pancakes with scrambled eggs, and toast", true, 2.99)
# 		addItem("Regular Pancake Breakfast", "Pancakes with fried eggs, sausage", false, 2.99)
# 		addItem("Blueberry Pancakes", "Pancakes made with fresh blueberries", true, 3.49)
# 		addItem("Waffles", "Waffles with your choice of blueberries or strawberries", true, 3.59)
# 	end

# 	def addItem(name, description, vegetarian, price)
# 		@menuItems << MenuItem.new(name, description, vegetarian, price)
# 	end

# 	def getMenuItems
# 		@menuItems
# 	end

# 	def createIterator
# 		DinerMenuIterator.new(@menuItems)
# 	end
# end

# class DinerMenu < Menu
# 	MAX_ITEMS = 6

# 	def initialize
# 		@menuItems = [MAX_ITEMS]
# 		@numberOfItems = 0
# 		addItem("vegetarian BLT", "(Fakin') Bacon with lettuce & tomato on whole wheat", true, 2.99)
# 		addItem("BLT", "Bacon with lettuce & tomato on whole wheat", false, 2.99)
# 		addItem("Soup of the day", "Soup of the day, with a side of potato salad", false, 3.29)
# 		addItem("Hotdog", "A hot dog, with saurkraut, relish, onios, topped with cheese", false, 3.05)
# 		addItem("Steamed Veggies and Brown Rice", "Steamed vegetables over brown rice", true, 3.99)
# 		addItem("Pasta", "Spaghetti with Marinara Sauce, and a slice of sourdugh bread", false, 3.89)
# 	end

# 	def addItem(name, description, vegetarian, price)
# 		if @numberOfItems >= MAX_ITEMS
# 			puts "Sorry, menu is full! Can't add item to menu"
# 		else
# 			@menuItems[@numberOfItems] = MenuItem.new(name, description, vegetarian, price)
# 			@numberOfItems += 1
# 		end
# 	end

# 	def createIterator
# 		DinerMenuIterator.new(@menuItems)
# 	end
# end

# class CafeMenu < Menu
# 	def initialize
# 		@menuItems = Hash.new
# 		addItem("Veggies Burger and Air Fries ", "Veggies burger on a whole wheat bun, lettuce, tomato and fries", true, 3.99)
# 		addItem("Soup of the day", "A cup of soup of the day, with a side salad", false, 3.69)
# 		addItem("Burrito", "A large burrito, with whole pint beans, salsa, guacamole", true, 4.29)
# 	end

# 	def addItem(name, description, vegetarian, price)
# 		@menuItems[name] = MenuItem.new(name, description, vegetarian, price)
# 	end

# 	def createIterator
# 		DinerMenuIterator.new(@menuItems.values)
# 	end
# end

# class DinerMenuIterator
# 	def initialize(items)
# 	  @items = items
# 	  @position = 0
# 	end

# 	def next
# 		item = @items[@position]
# 		@position += 1
# 		item
# 	end

# 	def hasNext
# 		if @position >= @items.length || @items[@position].nil?
# 			false
# 		else
# 			true
# 		end
# 	end

# 	def remove
# 		# remove position!!!
# 	end
# end