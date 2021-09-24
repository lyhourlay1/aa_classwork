
def my_min1(list)
  list.each do |ele1|
    list.each do |ele2|
      if ele1 > ele2
        ele2 
      else
        ele1 
      end 
    end
  end
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
p my_min1(list) #=> 