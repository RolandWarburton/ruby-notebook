# mixins is the idea of combining two modules to
# gain multuple inheritence from one parent class

# # angry
# class Angry
#   def initialize
#     @angry = true
#   end
# end

# # big
# class Big
#   def initialize
#     @big = true
#   end
# end

# This does not work

# class BigAngryRobot < Angry < Big
# end

# Instead, we can do multiple inheritence with modules to create a mixin...

# angry
module Angry
  ANGRY = true
end

# big
module Big
  BIG = true
end

# mixin
class BigAndAngry
  include Big
  include Angry
  def foo
    is_big = Big::BIG
    is_angry = Angry::ANGRY

    if is_big && is_angry
      puts 'its big AND angry'
    end
  end
end

obj = BigAndAngry.new
obj.foo
