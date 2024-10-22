def bubble_sort(arr)
  previous_number = 0
  cont = -1
  while cont != 0
    cont = 0
    i = 0
    while i < arr.length
      if i.zero?
        previous_number = arr[i]
        i += 1
        next
      end
      if previous_number > arr[i]
        arr[i - 1] = arr[i]
        arr[i] = previous_number
        cont += 1
      else
        previous_number = arr[i]
      end
      i += 1
    end
  end
  p arr
end

bubble_sort([4, 3, 78, 2, 0, 2])
bubble_sort([6, 5, 3, 1, 8, 7, 2, 4])
bubble_sort([5, 2, 1, 3, 6, 4])
