puts 'array shorthand'
arr = *(1..3).to_a # to_a turns a Range to an Array
puts arr.inspect

puts
puts 'concat arrays'
numbers_to_ten = [*'1'..'5'] + [*'6'..'10']
puts numbers_to_ten.inspect

puts
puts 'array with Array.new'
a = Array.new(2, true) # [true, true]
b = Array.new(2) {|i| i.to_s} # [0, 1]
puts a.inspect
puts b.inspect

puts
puts 'getting elements'
arr = ['a', 'b', 'c'] 
puts arr.at(0) # "a" (this is fast)
puts arr[0] # "a" (this is fast)
puts arr.fetch(100, 'fail!')
puts "#{arr.count} is the same as #{arr.length}" # its 3
puts arr.length > 2? 'its long' : 'it aint that long'
puts "first is #{arr.first} last is #{arr.last}"
puts arr[0, 2].inspect # a, b
puts arr[-1] # c

puts
puts 'searching'
arr = ['a', 'b', 'c'] 
puts arr.include?('a')
