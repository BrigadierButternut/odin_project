require 'pry'

class Node
  attr_accessor :value, :parent, :children

  def initialize
    @value = nil
    @parent = nil
    @children = {left: nil, right: nil}
  end

  def value
    @value
  end

  def parent
    @parent
  end

  def children
    @children
  end

end



def find_parent(root,leaf)
  if leaf.value > root.value && root.children[:right] == nil
    root.children[:right] = leaf
    leaf.parent = root
    return
  elsif leaf.value <= root.value && root.children[:left] == nil
    root.children[:left] = leaf
    leaf.parent = root
    return
  elsif leaf.value <= root.value
    find_parent(root.children[:left],leaf)
  else
    find_parent(root.children[:right],leaf)
  end
end

def build_tree(arr)
  tree_root = Node.new
  tree_root.value = arr[0]
  arr[1..-1].each do |element|
    node = Node.new
    node.value = element
    find_parent(tree_root,node)
  end
    return tree_root
end

def breadth_first_search(item, arr)
  tree_root = build_tree(arr)
  item_location = nil
  search_array = [tree_root]
  check_value = search_array[0]
  until check_value.children.values.all? {|value| value == nil}
    if item == check_value.value
      item_location = check_value
      break
    else
      search_array = search_array[1..-1]
      check_value.children.values.compact.each do |child|
        search_array << child
      end
      check_value = search_array[0]
    end #end of if statement
  end #end of until loop
  if item_location == nil
    puts "Item does not exist in array"
  else
    puts "Item is located in #{item_location}"
    puts "Item value: #{item_location.value}"
  end
end


arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

breadth_first_search(4,arr)
