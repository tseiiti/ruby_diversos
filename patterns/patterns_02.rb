require './patterns_00.rb'

#
# 2. O Padrão Observer
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

if __FILE__ == $0
	puts "*** Observer Pattern ***\n\n"

	weatherData = WeatherData.new
	currentDisplay = CurrentConditionsDisplay.new(weatherData)
	weatherData.setMeasurements(80, 65, 30.4)
	weatherData.setMeasurements(82, 70, 29.2)
	weatherData.setMeasurements(78, 90, 29.2)
end