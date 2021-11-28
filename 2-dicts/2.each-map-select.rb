def add_one(num)
  num + 1
end

dict = {
  "roland" => "person1",
  "maeesha" => "person2"
}

puts "each just iterates over each value"
dict.each {|pair| puts "pair: #{pair} - #{pair[0]} and #{pair[1]}"}

puts "select iterates and returns a new object based on the condition"
just_maeesha = dict.select {|key| key == "maeesha"}
puts just_maeesha

puts "you can also do the same as above but filder by the value"
just_maeesha2 = dict.select {|key, val| val == "person2"}
puts just_maeesha2 # {"maeesha" => "person2"}

puts "while select can mutate the same object, map returns a new object"
nameIsRoland = dict.map {|key, val| key == "roland"}
puts nameIsRoland.join(", ") # [true, false]
