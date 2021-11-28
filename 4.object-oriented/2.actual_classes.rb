# robot class
class Robot
  # this is required to provide simple getters and setters
  # attr_accessor :location, :name

  # just setters
  # attr_writer :location, :name

  # just getters
  # attr_reader :location, :name

  def initialize(location = { 'x' => 0, 'y' => 0 }, name = 'bob')
    @location = location
    @name = name
  end

  def beep
    puts "beep i am #{@name} and i am at #{location}"
  end

  # simple custom setter
  def location=(value)
    @location = {
      'x' => value['x'],
      'y' => value['y']
    }
  end

  # simple custom getter
  def location
    "#{@location['x']} and #{@location['y']}".to_s
  end
end

loc = {
  'x' => 0,
  'y' => 2
}

# create a robot
robot = Robot.new(loc, 'ron')

# change its location through the setter
robot.location = {
  'x' => 2,
  'y' => 2
}

# simple method call
robot.beep

# simple getter call
puts robot.location
