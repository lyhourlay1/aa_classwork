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
    new_arr=[0,0]
    min=0
    max=0
    sum=0
    arr.each.with_index do |ele,idx|
        if (max-min)>sum
            sum = max-min
        end
        if min>=ele
            min =ele
            new_arr[0]=idx
        end
        if max<ele
            max=ele
            new_arr[1]=idx
        end
    end
    p new_arr
    new_arr==[0,0] ? nil : new_arr
end