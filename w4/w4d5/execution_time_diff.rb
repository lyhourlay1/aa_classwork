require 'byebug'
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
  #debugger 
  result = []
  list.each.with_index do |el1, idx1|
    sub_arr = []


    list[idx1..-1].each.with_index do |el2, idx2|
      sub_arr += [el2]
      result += [sub_arr]
    end
    #result << sub_arr
  end


  #need to sum sub array and return max
  result.map! {|ele| ele.sum}
  result.max 
end

# p largest_contiguous_subsum([5,3,1,8])#->[[5,3,1], [5,3],[5,1], [1, 3], [5], [1], [3]]
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])
# [2]
# [2,3]
# [2],[2,3]

def largest_contiguous_subsum_(list)
  


  # master_sum = 0
  # sum = 0
  # list.each do |ele|
  #   sum += ele if ele > 0 until 
  # end
  # sum 

  # max = 0
  # i = 0
  # while i < list.length 
  #   sum = [(0..i)].sum
  #   if sum > max
  #     max = sum
  #   end
  # end
  # result = []
  # sums = Hash.new()

  #can't use a nested loop, can't store sub_arrays, can't scale memory complexity with input
  #o(n) time complexity

  #debugger 

  # until (list.first > 0) && (list.last > 0)
  #   if list.first < 0
  #     list.shift
  #   else
  #     list.pop
  #   end
  # end 

  # sum = list.sum

  # list.each_with_index do |ele, idx|
  #   if sum - ele > sum 
  #     list.delete_at(idx)
  #   end 
  # end

  # list.sum 

  # list.each do |ele|

  # end

  # result 
end

#p largest_contiguous_subsum_([5,3,1,8])#->[[5,3,1], [5,3],[5,1], [1, 3], [5], [1], [3]]
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum_(list) # => -1 (from [-1])