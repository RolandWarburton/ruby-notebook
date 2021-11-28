# encapsulation is the concept of hiding implementation details

# robot
class Robot
  def initialize
    @missiles = 10
  end

  def fire_missile
    puts 'fire!'
    @missiles -= 1
    true # return true to prevent leaking number of missles (its top secret)
  end
end

robot = Robot.new
should_be_true = robot.fire_missile
puts should_be_true # true

# this is not defined because its hidden
# puts robot.missiles

# its not TOTALLY hidden however
puts robot.instance_variable_get('@missiles') # 9
