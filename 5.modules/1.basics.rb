require './5.modules/modules/automata.rb'

# robot
class Robot
  include Automata
  def info
    puts Automata::ARE_ROBOTS_COOL
    puts Automata.check_if_robots_are_cool
  end
end

# create a robot and get some info on it
Robot.new.info
