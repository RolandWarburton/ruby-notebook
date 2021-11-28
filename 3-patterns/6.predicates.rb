def was_passed_chore(task)
  if ["cleaning", "cooking"].include? task
    return true
  else
    return false
  end
end

def was_passed_chore_shorthand(task)
  ["cleaning", "cooking"].include? task
end

puts "longhand"
puts was_passed_chore("cooking")
puts was_passed_chore("movies")

puts
puts "shorthand"
puts was_passed_chore_shorthand("cooking")
puts was_passed_chore_shorthand("movies")

puts
puts "ternary"
puts was_passed_chore("cleaning") ? "this is a chore" : "this is not a chore"