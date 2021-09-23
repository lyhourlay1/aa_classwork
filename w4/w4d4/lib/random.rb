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
end