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

## current load levels should now be at 0.75 (full capacity).

## uncomment the below to exceed your load factor, triggering your hash map’s growth functionality and doubling its capacity:

# test.set('moon', 'silver')