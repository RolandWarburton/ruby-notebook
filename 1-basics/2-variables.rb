name = "roland"
age = 22
male = true
distance = 3.1.to_f
friends = ["a", "b"]
friends.push("c")

puts "hello #{name}"

puts "you are #{age} years old"

puts "you are #{male ? "male" : "female"}"

puts "your distance is #{distance.round()}"

puts "the first letter of your name is #{name[0,1]}"

puts "random #{rand(1..10)}"

puts "you have #{friends.length} friends"