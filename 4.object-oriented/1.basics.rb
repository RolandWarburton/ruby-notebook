robot = Object.new

def robot.beep
  puts 'beep'
end

def robot.boop
  puts 'boop'
end

robot.send(:beep)
robot.boop

puts 'remove the method'.upcase
robot.singleton_class.send(:undef_method, :boop)