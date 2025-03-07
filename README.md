In case I forget....

######

WITH A SEPARATE CHAIN/NESTED ARRAY:

When we have "bucket = @buckets[index]", we're looking in the specific bucket at the given index (which is made up based on the input aka key parameter that is paased into the hash method). 

Then we come to the .each do part. 

At this point are we metaphorically picking up the slips of paper within that bucket and looking at the two things written on each piece of paper, pair[0] which represents that slip of paper's key and pair[1] which represents that slip's value

Example:
@buckets = [
  nil, 
  nil, 
  [ ['apple', 5], ['banana', 3] ],  # bucket at index 2
  nil
]

At index = 2, the bucket contains two slips of paper: ['apple', 5] and ['banana', 3]

######

WITH A LINKED LIST:

- first turn your input/key into a hash code using the hash method, then use the hashcode as an index (using modulo to make a larger hashcode smaller) that represents a specific bucket that resides at that location 
--> (index = hash(key) % @capacity)
- refer to that specific bucket by the variable bucket (!!bucket IS a linked list!! It doesn't hold a linked list, it is a linked list)
--> (bucket = @buckets[index])
- initially refer to the head/first Node of the linked list in that bucket by the variable current (current = bucket)
- the contents of a specific bucket can be represented like this:
-- bucket -> Node(key1, value1) -> Node(key2, value2) -> Node(key3, value3) -> nil