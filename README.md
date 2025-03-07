In case I forget....

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