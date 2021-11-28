puts "procs have access to parent scope"
def call_me(my_proc)
  count = 2
  my_proc.call
end

def my_program
  count = 1
  puts call_me(Proc.new {puts count}) # 1
end

my_program()

puts
puts "you can do binding as well"
def call_me_bind
  var_in_function = 100
  return binding
end

puts call_me_bind.class # Binding
puts call_me_bind.eval("var_in_function") # 100