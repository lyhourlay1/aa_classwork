def anagram?(str1, str2)
    arr1= str1.split("")
    arr2= str2.split("")
    all_combos=arr1.permutation(arr1.length).to_a
    all_combos.include?(arr2)
end

# p anagram?("gizmo", "sally")    #=> false
# p anagram?("elvis", "lives")    #=> true