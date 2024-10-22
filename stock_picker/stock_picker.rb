def stock_picker(array)
  arr = []
  profit = 0
  array.each_with_index do |i_value, i_index|
    array.each_with_index do |j_value, j_index|
      next unless (j_value >= i_value) && (j_index >= i_index)

      result = j_value - i_value
      if result > profit
        profit = result
        arr[0] = i_index && arr[1] = j_index
      end
    end
  end
  puts profit
  p arr
end

stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
