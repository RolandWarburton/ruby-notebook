def add_num(num1, num2=10)
  return num1 + num2
end

sum = add_num(5)
puts sum

if sum == 1 or sum == 15
  puts "The sum is 1 or 15"
elsif sum == 3
  puts "The sum is 3"
else
  puts "The sum is neither 1, 3, or 15"
end
