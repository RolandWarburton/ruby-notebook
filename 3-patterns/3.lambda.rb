say_name = -> {puts "roland"}

puts "these all call the lambda".upcase
say_name.call
say_name.()
say_name.[]

puts
puts "you can call the lambda right away".upcase
puts ->(count) {puts count}.call(1000)

puts "or an example of above but with a proc".upcase
Proc.new {|count| puts count}.call(1000)

puts
puts "lambda can also take args".upcase
greet = ->(name) {puts "hello #{name}"}
greet.("roland ")

puts
puts "lambdas do care about arguments".upcase
bark = ->(sound) {puts "#{sound}"}
bark.call("woof")