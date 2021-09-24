
def my_min1(list)
  list.each.with_index do |ele1,idx1|
    list.each.with_index do |ele2,idx2|
      if ele1 > ele2
        list.delete_at(idx1)
      else
        list.delete_at(idx2)
      end 
    end
  end
  list.min
end


#Phase 2 
def my_min2(list)
  min = list[0]
  list.each do |ele|
    if ele < min
      min = ele
    end
  end
  min 
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min1(list) #=> 

def largest_contiguous_subsum(list)
  sub_arr=[list]
  list.each.with_index do |el1, idx1|
    sub_arr<< [el1]
    list.each.with_index do |el2, idx2|
      if idx1 != idx2 && !sub_arr.include?([el1,el2].sort)
        sub_arr << [el1,el2].sort
      end
    end
  end
  #need to sum sub array and return max
  sub_arr
end

p largest_contiguous_subsum([5,3,1,8]) #->[[5,3,1], [5,3],[5,1], [1, 3], [5], [1], [3]]
[2]
[2,3]
[2],[2,3]