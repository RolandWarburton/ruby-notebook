puts 'using a string as the key'.upcase
dict = {
  'roland' => 'person'
}

puts dict.keys[0]
puts dict['roland']
puts

puts '{:a => b} are the same (see symbols)'.upcase
dict_one = {
  # :roland => 'person' # this is the old way
  roland: 'person' # this is the new way
}
puts "#{dict_one.keys[0]} is a #{dict_one[:roland]}"


dict_two = {
  roland: 'person'
}
puts "#{dict_two.keys[0]} is a #{dict_two[:roland]}"

puts
puts 'another way of creating a hash is with Hash.new'.upcase
# hash_object = Hash.new # old way
hash_object = {} # new way
hash_object[:roland] = 'person'
puts "#{hash_object.keys[0]} is a #{hash_object[:roland]}"

puts
puts 'iterating over a hash'.upcase
people = {
  'roland' => 'person',
  'bob' => 'person as well',
  'john' => 'a guy',
}

people.each do |key, value|
  puts "#{key} is a #{value}"
end

puts
puts 'iterating over an array'.upcase
people_array = %w[roland bob john] # an array of words

people_array.each_with_index do |person, i|
  puts "iter #{i}"
  # this is bad
  # if person == 'roland'
  #   puts "#{person} is a person"
  # end

  # this is good
  puts "#{person} is a person" if person == 'roland'
end
