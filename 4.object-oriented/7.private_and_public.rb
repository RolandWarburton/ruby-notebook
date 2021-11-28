# robot
class Robot
  # create getters for missiles
  attr_reader :missiles

  def initialize
    @missiles = 10
    @ready_to_fire = false
  end

  # this is public by default
  def fire_missile
    reload unless @ready_to_fire
    puts 'fire!'
    @ready_to_fire = false
  end

  private

  # we cannot call this method on robot (we can only call internally)
  def reload
    @missiles -= 1
    @ready_to_fire = true
    puts 'reloaded'
  end
end

robot = Robot.new
robot.fire_missile

# we can also get the number of missiles (but not set it, see 'attr_accessor')
puts robot.missiles
