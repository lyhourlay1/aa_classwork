def anagram?(str1, str2)
    arr1= str1.split("")
    arr2= str2.split("")
    all_combos=arr1.permutation(arr1.length).to_a
    all_combos.include?(arr2)
end

def anagram2?(str1, str2)
  extra_indice = []
  str2 = str2.split("")
  str1.each_char do |ele|
    if not (str2.index(ele) == nil)
      str2.delete_at(str2.index(ele))
    else
      extra_indice += [ele] 
    end 
  end

  str2.empty? and extra_indice.empty?
end

def anagram3?(str1, str2)
  str1.split("").sort == str2.split("").sort
end

def anagram4?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char do |ele|
    hash1[ele] += 1
  end
  str2.each_char do |ele|
    hash2[ele] += 1
  end

  hash1 == hash2
end

def anagram5?(str1, str2)
  hash = Hash.new(0)

  str1.each_char do |ele|
    hash[ele] += 1
  end

  str2.each_char do |ele|
    hash[ele] -= 1
  end

  hash.values.all?{|ele| ele == 0}
end

p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true

p anagram2?("gizmo", "sally")    #=> false
p anagram2?("elvis", "lives")    #=> true
p anagram3?("gizmo", "sally")    #=> false
p anagram3?("elvis", "lives")    #=> true
p anagram4?("gizmo", "sally")    #=> false
p anagram4?("elvis", "lives")    #=> true
p anagram5?("gizmo", "sally")    #=> false
p anagram5?("elvis", "lives")    #=> true
