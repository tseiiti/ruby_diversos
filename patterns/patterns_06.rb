require './patterns_00.rb'

#
# 6. O Padrão Command
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

if __FILE__ == $0
	puts "*** Command Pattern ***\n\n"

	livingRoomLight = Light.new("Living Room")
	kitchenLight = Light.new("Kitchen")
	ceilingFan = CeilingFan.new("Living Room")
	garageDoor = GarageDoor.new("Master")

	remote = RemoteControl.new
	remote.setCommand(0, LightOnCommand.new(livingRoomLight), LightOffCommand.new(livingRoomLight))
	remote.setCommand(1, LightOnCommand.new(kitchenLight), LightOffCommand.new(kitchenLight))
	remote.setCommand(2, CeilingFanOnCommand.new(ceilingFan), CeilingFanOffCommand.new(ceilingFan))
	remote.setCommand(3, GarageDoorUpCommand.new(garageDoor), GarageDoorDownCommand.new(garageDoor))
	remote.setCommand(4, CeilingFanHighCommand.new(ceilingFan), CeilingFanOffCommand.new(ceilingFan))
	remote.setCommand(5, CeilingFanMediumCommand.new(ceilingFan), CeilingFanOffCommand.new(ceilingFan))

	puts remote
	remote.onButtonWasPressed(0)
	remote.offButtonWasPressed(0)
	remote.undoButtonWasPressed
	remote.onButtonWasPressed(1)
	remote.offButtonWasPressed(1)
	remote.onButtonWasPressed(2)
	remote.offButtonWasPressed(2)
	remote.onButtonWasPressed(3)
	remote.offButtonWasPressed(3)


	remote.onButtonWasPressed(4)
	remote.offButtonWasPressed(4)
	remote.undoButtonWasPressed

	remote.onButtonWasPressed(5)
	remote.offButtonWasPressed(5)
	remote.undoButtonWasPressed
	remote.onButtonWasPressed(4)
	remote.undoButtonWasPressed
end

# Fazer macro!!!