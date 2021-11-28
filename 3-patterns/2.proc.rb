puts "procs are like lambdas".upcase
my_proc = Proc.new { |thing| puts "I like #{thing}"}
my_proc.call("chocolate")

puts
puts "procs dont care about arguments".upcase
t = Proc.new { |x,y| puts "I don't care about arguments!" }
t.call()