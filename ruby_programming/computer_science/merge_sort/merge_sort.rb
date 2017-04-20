def merge_sort(arr)
  if arr.length == 1
    return arr
  else
    arr1 = arr
    arr2 = arr.slice!(arr.length/2..-1)
    merge(merge_sort(arr1),merge_sort(arr2))
  end
end

def merge(arr1,arr2)
  sorted_arr = []

  while arr1.length >= 1 && arr2.length >= 1
    if arr1[0] < arr2[0]
      sorted_arr << arr1[0]
      arr1.drop(1)
    else
      sorted_arr << arr2[0]
      arr2.drop(1)
    end
  end

  while arr1.length >= 1
    sorted_arr << arr1[0]
    arr1.drop(1)
  end

  while arr2.length >= 1
    sorted_arr << arr2[0]
    arr2.drop(1)
  end

  return sorted_arr

end

test_arr = [4,15,2,16,28,49,30,1]

merge_sort(test_arr)
