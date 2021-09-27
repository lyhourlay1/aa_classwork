class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
   sum = 0
    self.each_with_index do |ele, idx|
       sum += ele.hash  * idx
    end
    sum
  end
end

class String
  def hash
    alphabet = ("a"..'z').to_a
    array_chars = self.chars
    array_chars.map! { |ele| alphabet.index(ele) }
    array_chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = self.sort_by {|k, v| v}
    array.flatten!
    alphabet = ("a"..'z').to_a
    array_chars = array
    array_chars.map! { |ele| alphabet.index(ele) }
    sum = 0
    array_chars.each_with_index do |ele, idx|
       sum += ele.hash 
    end
    sum
  end
end
