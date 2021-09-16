require './patterns_00.rb'
require './patterns_01.rb'

#
# 7. O Padrão Adapter
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

if __FILE__ == $0
	puts "*** Adapter Pattern ***\n\n"

	mallard = MallardDuck.new
	turkey = WildTurkey.new
	turkeyAdapter = TurkeyAdapter.new(turkey)

	puts "The Turkey says..."
	turkey.gobble
	turkey.fly

	puts "\nThe duck says..."
	mallard.performQuack
	mallard.performFly

	puts "\nThe TurkeyAdapter says..."
	turkeyAdapter.performQuack
	turkeyAdapter.performFly
end



#
# 7 O Padrão Facade (Fachada)
#

class Amplifier
	def name
	  "Top-O-Line Amplifier"
	end
	def on
		puts "#{name} on"
	end
	def off
		puts "#{name} off"
	end
	def setCd(cdPlayer)
		@cdPlayer = cdPlayer
	end
	def setDvd(dvdPlayer)
		puts "#{name} setting DVD player to #{dvdPlayer.name}"
	end
	def setStereoSound

	end
	def setSurroundSound
		puts "#{name} surround sound on (5 speakers, 1 subwoofer)"
	end
	def setTuner(tuner)
		@tuner = tuner
	end
	def setVolume(volume)
		puts "#{name} setting volume to #{volume}"
	end
end
class Tuner
	def on

	end
	def off

	end
	def setAm

	end
	def setFm

	end
	def setFrequency(frequency)
		@frequency = frequency
	end
end
class CdPlayer
	def name
	  "Top-O-Line CD Player"
	end
	def on
		puts "#{name} on"
	end
	def off
		puts "#{name} off"
	end
	def eject

	end
	def pause

	end
	def play

	end
	def stop

	end
end
class DvdPlayer
	def name
	  "Top-O-Line DVD Player"
	end
	def on
		puts "#{name} on"
	end
	def off
		puts "#{name} off"
	end
	def eject
		puts "#{name} eject"
	end
	def pause

	end
	def play(movie)
		@movie = movie
		puts "#{name} playing \"#{@movie}\""
	end
	def setSurroundAudio

	end
	def setTwoChannelAudio

	end
	def stop
		puts "#{name} stopped \"#{@movie}\""
	end
end
class Screen
	def name
	  "Theater Screen"
	end
	def up
		puts "#{name} going up"
	end
	def down
		puts "#{name} going down"
	end
end
class PopCornPopper
	def name
	  "Popcorn Popper"
	end
	def on
		puts "#{name} on"
	end
	def off
		puts "#{name} off"
	end
	def pop
		puts "#{name} popping popcorn!"
	end
end
class TheaterLights
	def name
	  "Theater Ceiling Lights"
	end
	def on
		puts "#{name} on"
	end
	def off
		puts "#{name} off"
	end
	def dim(percent)
		puts "#{name} dimming to #{percent}%"
	end
end
class Projector
	def name
	  "Top-O-Line Projector"
	end
	def on
		puts "#{name} on"
	end
	def off
		puts "#{name} off"
	end
	def tvMode

	end
	def wideScreenMode
		puts "#{name} in widescreen mode (16x9 aspect ratio)"
	end
end
class HomeTheaterFacade
	def initialize(amp, tuner, dvd, cd, projector, screen, lights, popper)
	  @amp = amp
	  @tuner = tuner
	  @dvd = dvd
	  @cd = cd
	  @projector = projector
	  @screen = screen
	  @lights = lights
	  @popper = popper
	end
	def watchMovie(movie)
		puts "Get ready to watch a movie..."
		@popper.on
		@popper.pop
		@lights.dim(10)
		@screen.down
		@projector.on
		@projector.wideScreenMode
		@amp.on
		@amp.setDvd(@dvd)
		@amp.setSurroundSound
		@amp.setVolume(5)
		@dvd.on
		@dvd.play(movie)
	end
	def endMovie
		puts "Shutting movie theater down"
		@popper.off
		@lights.on
		@screen.up
		@projector.off
		@amp.off
		@dvd.stop
		@dvd.eject
		@dvd.off
	end
end

if __FILE__ == $0
	puts "\n\n\n*** Facade Pattern ***\n\n"

	homeTheater = HomeTheaterFacade.new(
		Amplifier.new,
		Tuner.new,
		DvdPlayer.new,
		CdPlayer.new,
		Projector.new,
		Screen.new,TheaterLights.new,
		PopCornPopper.new)

	homeTheater.watchMovie("Raiders of the Lost Ark")
	homeTheater.endMovie
end
