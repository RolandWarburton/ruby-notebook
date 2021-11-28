# Modules are a way of grouping together methods, classes, and constants

# robot module
module Automata
  ARE_ROBOTS_COOL = true

  def self.check_if_robots_are_cool
    ARE_ROBOTS_COOL ? 'hell yeah' : 'nah not really'
  end
end
