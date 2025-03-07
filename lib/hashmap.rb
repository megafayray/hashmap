class HashMap
  LOAD_FACTOR = 0.75 #the factor that will determine when it is a good time to grow our buckets
  INITIAL_CAPACITY = 16

  def initialize
    @buckets = Array.new(INITIAL_CAPACITY)
    @length = 0
    @capacity = INITIAL_CAPACITY #the total number of buckets we currently have.
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

end

  def set(key, value)
    #come up with an index which will help us decide where to store the key-value pair.
    #the modulo % operation helps deal with big numbers resulting from the hash function
    index = hash(key) % @capacity

    bucket = @buckets[index] ||= [] # Initialize the bucket if it's nil
    
    # Check if the key already exists in this bucket
    bucket.each do |pair|
      if pair[0] == key
        pair[1] = value  # Update the value if key exists
        return
      end
    end
    
    # If key doesn't exist, add the new key-value pair to the bucket
    bucket << [key, value]
    @length += 1

    # Resize the hash map if necessary
    resize if @length > (@capacity * LOAD_FACTOR) #16*0.75 = 12 so once length hits 13
  end

  def get(key)
    index = hash(key) % @capacity
    bucket = @buckets[index]

    return nil if bucket.nil? #if the bucket is nil or empty, return nil

    bucket.each do |pair|
      if pair[0] == key
        return pair[1] #return the value
      end
    end
    return nil #if it goes through all the buckets at that index and doesn't get a match return nil
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
  end

  def remove(key)
  end

  def keys
  end
  
  def values
  end

  def entries
  end
  
  private

  def resize
    @capacity *= 2 #double the capacity
    new_buckets = Array.new(@capacity)
    
    # Rehash all the entries and redistribute them in the new buckets
    @buckets.each do |bucket|
      next if bucket.nil?
      
      bucket.each do |key, value|
        index = hash(key) % @capacity
        new_buckets[index] ||= []
        new_buckets[index] << [key, value]
      end
    end
    
    @buckets = new_buckets
  end

end