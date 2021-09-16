system("cls")

#FACTORY PATTERN

class Shape
	#Interface
	def draw
		raise "#{self.class.name} needs to implement '#{__method__}' for interface #{self.class.superclass}"
	end
end

class Rectangle < Shape
	def draw
		puts "Inside Rectangle::draw method."
	end
end

class Square < Shape
	def draw
		puts "Inside Square::draw method."
	end
end

class Circle < Shape
	def draw
		puts "Inside Circle::draw method."
	end
end

class ShapeFactory
	def getShape(shapeType)
		if shapeType.downcase == "circle"
			return Circle.new
		elsif shapeType.downcase == "rectangle"
			return Rectangle.new
		elsif shapeType.downcase == "square"
			return Square.new
		end
		return nil
	end
end

list = []
shapeFactory = ShapeFactory.new
list << shapeFactory.getShape("CIRCLE")
list << shapeFactory.getShape("RECTANGLE")
list << shapeFactory.getShape("SQUARE")
#list << shapeFactory.getShape("teste")
list.each{ |o| o.draw }
