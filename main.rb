require_relative 'lib/hashmap.rb'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

test.set('lion', 'ombre') #this overwrites an existing node

test.set('moon', 'silver') #these exceed the load factor:
test.set('computer', 'many')
test.set('pig', 'pink')

test.set('pig', 'dusty rose') #overrides the value associated with the key 'pig' from pink to rose
puts "The value of 'pig' is #{test.get('pig')}" #returns 'dusty rose'
puts "The statement 'puppy exists in this hashmap' is #{test.has?('puppy')}" #returns false
puts "The statement 'elephant exists in this hashmap' is #{test.has?('elephant')}" #returns true

# puts test.remove #haven't done this one
puts "Length: #{test.length}"
# puts test.clear
puts "Keys: #{test.keys}"
puts "Values: #{test.values}"
puts "Entries: #{test.entries}"
puts "Current load: #{test.current_load}"
puts "Capacity: #{test.capacity}"
