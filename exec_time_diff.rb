require "byebug"

# def my_inefficient_min(list)
#   # list.each do |i|
#   #   list.each do |j|
#   #     if j > i
#   #       next
#   #     end
#   #   end
#   #   return i
#   # end

#   list.each do |i|
#     if list.all? { |j| j >= i }
#       return i
#   end
#   end
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_inefficient_min(list)  # =>  -5
# #Time Complexity for my_inefficient_min = O(n^2)

# def my_min(list)
#   min = list[0]
#   list.each do |i|
#     if i < min
#       min = i
#     end
#   end
#   return min
# end

# p my_min(list)
# #Time Complexity for my_min = O(n)


def largest_contiguous_subsum(list)
  all_subs = []                      #O(1)
  list.each_with_index do |el, i|    # O(n)
    list.each_with_index do |el2, j|  # O(n)
      all_subs << list[i..j] if j >= i # O(1)
    end
  end
   p all_subs                             # O(1)
  sub_sums = []                           # O(1)
  all_subs.each do |sub_arr|              # O(n)
    sub_sums << sub_arr.sum               # O(1)
  end
  sub_sums.sort[-1]                       # O(logn )

end

# list1 = [5, 3, -7]
# p largest_contiguous_subsum(list1) # => 8

# list2 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])

# list3 = [-5, -1, -3]
# p largest_contiguous_subsum(list3) # => -1 (from [-1])


def eff_largest_contiguous_subsum(list)
  prev_best_sum = list[0]
  curr_sum = 0
  (0...list.length).each do |i|


    curr_sum += list[i]

    if curr_sum > prev_best_sum
      prev_best_sum = curr_sum
    end

    # if prev_best_sum < 0 && curr_sum < list[i]
    #   curr_sum = list[i]

    if curr_sum < 0
      curr_sum = 0
    end


  end
  prev_best_sum
end


list1 = [5, 3, -7]
p eff_largest_contiguous_subsum(list1) # => 8

list2 = [2, 3, -6, 7, -6, 7]
p eff_largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])

list3 = [-5, -1, -3]
p eff_largest_contiguous_subsum(list3) # => -1 (from [-1])
