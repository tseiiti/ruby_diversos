require './patterns_00.rb'

#
# 10. O Padrão State
#

class State
	def initialize(gumballMachine)
		@gumballMachine = gumballMachine
	end

	def insertQuarter
		interface
	end

	def ejectQuarter
		interface
	end

	def turnCrank
		interface
	end

	def dispense
		interface
	end
end

class GumballMachine
	attr_accessor :count,
	:soldOutState,
	:noQuarterState,
	:hasQuarterState,
	:soldState,
	:winnerState

	def initialize(count)
		@soldOutState = SoldOutState.new(self)
		@noQuarterState = NoQuarterState.new(self)
		@hasQuarterState = HasQuarterState.new(self)
		@soldState = SoldState.new(self)
		@winnerState = WinnerState.new(self)

		@count = count
		@state = @soldOutState
		@state = @noQuarterState if count > 0
	end

	def insertQuarter
		@state.insertQuarter
	end

	def ejectQuarter
		@state.ejectQuarter
	end

	def turnCrank
		@state.turnCrank
		@state.dispense
	end

	def setState(state)
		@state = state
	end

	def releaseBall
		puts "A gumball comes rolling out the slot..."
		@count -= 1 if @count != 0
	end

	def to_s
		"\nMighty Gumball, Inc.\n" +
		"Java-enabled Standing Gumball Model #2004\n" +
		"Inventory: " + @count.to_s + " gumballs\n" +
		@state.to_s
	end
end

class SoldOutState < State
	def insertQuarter
		puts "You can't insert another quarter, the machine is sold out"
	end

	def ejectQuarter
		puts "You can't eject, you haven't inserted a quarter yet"
	end

	def turnCrank
		puts "You turned, but there are no gumballs"
	end

	def dispense
		puts "No gumball dispense"
	end

	def to_s
		"Machine is sold out\n\n"
	end
end

class NoQuarterState < State
	def insertQuarter
		puts "You inserted a quarter"
		@gumballMachine.setState(@gumballMachine.hasQuarterState)
	end

	def ejectQuarter
		puts "You haven't inserted a quarter"
	end

	def turnCrank
		puts "You turned but there's no quarter"
	end

	def dispense
		puts "You need to pay first"
	end

	def to_s
		"Machine is waiting for quarter\n\n"
	end
end

class HasQuarterState < State
	def insertQuarter
		puts "You can't insert another quarter"
	end

	def ejectQuarter
		puts "Quarter returned"
		@gumballMachine.setState(@gumballMachine.noQuarterState)
	end

	def turnCrank
		puts "You turned..."
		@gumballMachine.setState(@gumballMachine.soldState)
	end

	def dispense
		puts "No gumball dispense"
	end
end

class SoldState < State
	def insertQuarter
		puts "Please wait, we're already giving you a gumball"
	end

	def ejectQuarter
		puts "Sorry, you already turned the crank"
	end

	def turnCrank
		puts "Turning twice doesn't get you another gumball"
	end

	def dispense
		@gumballMachine.releaseBall
		if @gumballMachine.count > 0
			@gumballMachine.setState(@gumballMachine.noQuarterState)
		else
			puts "Oops, out of gumballs!"
			@gumballMachine.setState(@gumballMachine.soldOutState)
		end
	end
end

class WinnerState < State
	def insertQuarter
		puts "WinnerState insertQuarter"
	end

	def ejectQuarter
		puts "WinnerState ejectQuarter"
	end

	def turnCrank
		puts "WinnerState turnCrank"
	end

	def dispense
		puts "YOU'RE A WINNER! You get two gumballs for your quarter"
		if @gumballMachine.count == 0
			@gumballMachine.setState(@gumballMachine.soldOutState)
		else
			@gumballMachine.releaseBall
			if @gumballMachine.count > 0
				@gumballMachine.setState(@gumballMachine.noQuarterState)
			else
				puts "Oops, out of gumballs!"
				@gumballMachine.setState(@gumballMachine.soldOutState)
			end
		end
	end
end

if __FILE__ == $0
	puts "*** State Pattern ***\n\n"

	gumballMachine = GumballMachine.new(5)

	puts gumballMachine

	gumballMachine.insertQuarter
	gumballMachine.turnCrank

	puts gumballMachine

	gumballMachine.insertQuarter
	gumballMachine.ejectQuarter
	gumballMachine.turnCrank

	puts gumballMachine

	gumballMachine.insertQuarter
	gumballMachine.turnCrank
	gumballMachine.insertQuarter
	gumballMachine.turnCrank
	gumballMachine.ejectQuarter

	puts gumballMachine

	gumballMachine.insertQuarter
	gumballMachine.insertQuarter
	gumballMachine.turnCrank
	gumballMachine.insertQuarter
	gumballMachine.turnCrank
	gumballMachine.insertQuarter
	gumballMachine.turnCrank

	puts gumballMachine
end



# class GumballMachine
# 	SOLD_OUT    = 0
# 	NO_QUARTER  = 1
# 	HAS_QUARTER = 2
# 	SOLD        = 3

# 	def initialize(count)
# 		@count = count
# 		@state = SOLD_OUT
# 		@state = NO_QUARTER if count > 0
# 	end

# 	def insertQuarter
# 		case @state
# 		when SOLD_OUT
# 			puts "You can't insert another quarter, the machine is sold out"
# 		when NO_QUARTER
# 			@state = HAS_QUARTER
# 			puts "You inserted a quarter"
# 		when HAS_QUARTER
# 			puts "You can't insert another quarter"
# 		when SOLD
# 			puts "Please wait, we're already giving you a gumball"
# 		end
# 	end

# 	def ejectQuarter
# 		case @state
# 		when SOLD_OUT
# 			puts "You can't eject, you haven't inserted a quarter yet"
# 		when NO_QUARTER
# 			# @state = HAS_QUARTER
# 			puts "You haven't inserted a quarter"
# 		when HAS_QUARTER
# 			@state = NO_QUARTER
# 			puts "Quarter returned"
# 		when SOLD
# 			puts "Sorry, you already turned the crank"
# 		end
# 	end

# 	def turnCrank
# 		case @state
# 		when SOLD_OUT
# 			puts "You turned, but there are no gumballs"
# 		when NO_QUARTER
# 			# @state = HAS_QUARTER
# 			puts "You turned but there's no quarter"
# 		when HAS_QUARTER
# 			@state = SOLD
# 			puts "You turned..."
# 			dispense
# 		when SOLD
# 			puts "Turning twice doesn't get you another gumball"
# 		end
# 	end

# 	def dispense
# 		case @state
# 		when SOLD_OUT
# 			puts "No gumball dispense"
# 		when NO_QUARTER
# 			puts "You need to pay first"
# 		when HAS_QUARTER
# 			puts "No gumball dispense"
# 		when SOLD
# 			puts "A gumball comes rolling out the slot"
# 			@count -= 1
# 			if @count == 0
# 				puts "Oops, out of gumballs!"
# 				@state = SOLD_OUT
# 			else
# 				@state = NO_QUARTER
# 			end
# 		end
# 	end

# 	def to_s
# 		"\nMighty Gumball, Inc.\n" +
# 		"Java-enabled Standing Gumball Model #2004\n" +
# 		"Inventory: " + @count.to_s + " gumballs\n" +
# 		case @state
# 		when NO_QUARTER
# 			"Machine is waiting for quarter\n\n"
# 		when SOLD_OUT
# 			"Machine is sold out\n\n"
# 		end
# 	end
# end

