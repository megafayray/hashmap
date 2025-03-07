class Node
  attr_accessor :key, :value, :next_node

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end
end

class HashMap
  attr_accessor :capacity
  
  LOAD_FACTOR = 0.75 #the factor that will determine when it is a good time to grow our buckets
  INITIAL_CAPACITY = 16

  def initialize
    @buckets = Array.new(INITIAL_CAPACITY)
    @length = 0
    @capacity = INITIAL_CAPACITY #the total number of buckets we currently have.
  end

  def current_load
    return @length.to_f / @capacity
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key, value)
    # Resize the hash map if necessary
    resize if @length > (@capacity * LOAD_FACTOR) #16*0.75 = 12 so once length hits 13 initially
    
    #come up with an index which will help us decide where (aka in which bucket) 
    ##to store the key-value pair/Node
    #the modulo % operation helps deal with big numbers resulting from the hash function
    index = hash(key) % @capacity
    bucket = @buckets[index]

    if bucket.nil? #if no linked list exists in the bucket, make one
      @buckets[index] = Node.new(key, value)
      @length += 1
    else # if there's already a linked list there, add to it
      current = bucket
      while current
        if current.key == key #if the pointer is pointing at a key that matches the input key
          current.value = value #update its value with the new one
          return 
        elsif current.next_node.nil? #if at the end add a new node
          current.next_node = Node.new(key, value)
          @length += 1
          return
        end
        current = current.next_node #if none of the other two circumstances apply, go to next node
      end
    end
  end

  def get(key)
    index = hash(key) % @capacity
    bucket = @buckets[index] #this is the bucket we want to look in

    current = bucket #initially this is the first node/head in the linked list in our specified bucket
    while current #traverse the list, going through each node
      return current.value if current.key == key #remember that current refers to the Node
      current = current.next_node
    end

    # return nil if bucket.nil? #if the bucket is nil or empty, return nil

    # bucket.each do |pair|
    #   if pair[0] == key
    #     return pair[1] #return the value
    #   end
    # end
    return nil #if it goes through all the buckets/nodes at that index and doesn't get a match return nil
  end

  def clear
    @capacity = INITIAL_CAPACITY
    @buckets = Array.new(@capacity)
    @length = 0
  end

  def length
    @length
  end

  def has?(key)
    index = hash(key) % @capacity
    bucket = @buckets[index] #this is the bucket we want to look in (the bucket IS a linked list)

    current = bucket #initially this is the first node/head in the linked list in our specified bucket
    while current #traverse the list, going through each node
      return true if current.key == key #remember that current refers to the Node
      current = current.next_node
    end

    return false
  end

  def remove(key)
  end

  def keys
    keys = []

    @buckets.each do |bucket|
      current = bucket
      while current
        keys << current.key
        current = current.next_node
      end
    end

    return keys
  end
  
  def values
    values = []

    @buckets.each do |bucket|
      current = bucket
      while current
        values << current.value
        current = current.next_node
      end
    end

    return values
  end

  def entries
    entries = []

    @buckets.each do |bucket|
      current = bucket
      while current
        entries << [current.key, current.value]
        current = current.next_node
      end
    end

    return entries
  end
  
  private

  def resize
    puts "Resize initiated"
    @capacity *= 2 #double the capacity
    new_buckets = Array.new(@capacity)
    
    # Rehash all the entries and redistribute them in the new buckets
    @buckets.each do |bucket|
      current = bucket
      while current
        index = hash(current.key) % @capacity
        new_buckets[index] ||= Node.new(current.key, current.value)
        current = current.next_node
      end
    end

    @buckets = new_buckets

    # @buckets.each do |bucket|
    #   next if bucket.nil?
      
    #   bucket.each do |key, value|
    #     index = hash(key) % @capacity
    #     new_buckets[index] ||= []
    #     new_buckets[index] << [key, value]
    #   end
    # end
  end

end