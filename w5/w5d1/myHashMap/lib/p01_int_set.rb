require 'set'
require "byebug"
class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max)

  end

  def insert(num)
    if is_valid?(num)
      @store[num]=true 
    else
      raise 'Out of bounds' 
    end
  end

  def remove(num)
    @store[num] = nil
  end

  def include?(num)
    @store[num]==true
  end

  private

  def is_valid?(num)
    (0..@store.length).include?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end


  # def []=(num)
  #   self[num] = num
  # end

  def insert(num)
    # self[num] = num
    @store[num % @store.length] << num 
    # true
  end

  def remove(num)
     @store[num % @store.length] = []
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end
  #   def []=(num)
  #   @store[num % @store.length] = num
  # end

  private

  def [](num)
      @store[num % @store.length]
  end



  def num_buckets
    @store.length
  end
end
require "byebug"
class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == @store.length
    if !include?(num)
      @store[num% @store.length]<<num 
      @count +=1
    end
  end

  def remove(num)
    if include?(num)
      @store[num% @store.length]=[]
      @count-=1
    end
  end

  def include?(num)
     @store[num% @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_arr= @store.flatten
    
    # if num_buckets <= @count
      @store = Array.new(num_buckets*2) { Array.new }
      @count=0
      # p @store
      temp_arr.each {|ele| insert(ele)}  
    # end
  end
end

