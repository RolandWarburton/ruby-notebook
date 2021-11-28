puts "a block is a scope with {}".upcase
puts

# this is one way of doing a block
puts "block shothand".upcase
["a", "b"].each { |elem| puts elem }
puts

# this is one way of doing a block
puts "block longhand".upcase
["a", "b"].each_with_index do |elem, i|
  puts i.to_s + " " + elem
end
puts

# introducing yeild
puts "introducing yield - when its called it runs the block".upcase
def print_once
  yield
end
print_once { puts "run this code" }
puts

# yield supports arguments
puts "yield supports arguments implicitly".upcase
def print_twice
  yield "!"
  yield "!!"
end
print_twice { |elem| puts "roland" + elem }
puts

puts "yield supports arguments explicitly"
def print_thrice(&block)
  block.call "!"
  block.call "!!"
  block.call "!!!"
end
print_thrice { |elem| puts "roland" + elem }

# custom block
def custom(arg, &block)
  puts "custom block"
  block.call(arg)
end

custom "roland" do |elem|
  puts elem
end

# # custom block (using a proc)
# def custom_block(array, &blk)
#   i = 0
#   while i < array.count
#     element = array[i]
#     puts "interating over #{i}=#{element}"
#     blk.call(element)
#     i += 1
#   end
# end

# letters = ["a", "b"]
# letters.custom_block do |elem|
#   puts elem
# end
