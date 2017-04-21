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
  puts tree_root.children
end



arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

build_tree(arr)
