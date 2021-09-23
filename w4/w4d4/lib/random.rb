class Array
    def my_uniq
        new_arr = []
        self.each do |ele|
            new_arr<< ele if !new_arr.include?(ele)
        end
        new_arr
    end
    def two_sum
        new_arr=[]
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                if i<j 
                    new_arr << [i,j] if self[i]+self[j]==0
                end
            end
        end
        new_arr
    end
    def my_transpose
      new_arr = []
      self[0].each.with_index do |el, i|
        row = []
        self.each.with_index do |subarr, j|
          row << self[j][i]
        end
        new_arr << row
      end
      new_arr
    end
end

def stock_picker(arr)
  arridx = []
  arrsum = []
  arr.each.with_index do |el, i|
    arr.each.with_index do |el2, i2|
      if i < i2 && el2 > el
        arridx << [i, i2]
        arrsum << (el2 - el)
      end
    end
  end
  if arridx.empty?
    return nil
  end
  max = arrsum.max
  arridx[arrsum.index(max)]
end