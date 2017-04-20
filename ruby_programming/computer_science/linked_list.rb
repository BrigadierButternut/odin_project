class LinkedList

  def initialize
    @head = nil
    @tail = nil
    @nodes = 0
  end

  def append(new_node)
    #adds nodes to end of the list

    temp = Node.new
    temp.value = new_node

    if @head.nil?
      #if the list is currently empty, new_node forms both the head and the tail of the list
      @head = temp
      @tail = temp
    else
      #if the list is not empty, @tail.next must be rerouted to point to temp; temp becomes the new tail
      @tail.next = temp
      @tail = temp
    end
    @nodes += 1
  end

  def prepend(new_node)
    #adds nodes to the beginning of the list

    temp = Node.new
    temp.value = new_node

    if @head.nil?
      #if the list is empty, new_node may not point to anything; no need to designate next value
      @head = temp
      @tail = temp
    else
      #specify the currenty @head value as the value that new_node points to
      temp.next = @head
      #new_node is now the head of the list
      @head = temp
    end
    @nodes += 1
  end

  def size
    #returns total number of nodes in the list
    @nodes
  end

  def head
    #returns first node in the list
    @head
  end

  def tail
    #returns last node in the list
    @tail
  end

  def at(index)
    #returns node given at certain index
  end

  def pop
    #removes the last element from the list
      if @tail.value.nil?
        return nil
      else
        mark = self.head
        counter = self.size-2
        while counter > 0
          mark = mark.send :next
          counter -= 1
        end
        value = @tail
        @tail = mark
        @tail.next = nil
        @nodes -= 1

        if @nodes == 0
          @tail = nil
          @head = nil
        end
      end
      return value
  end

  def contains? value
    #returns false if a value is not contained in the linked list and true if it does
    return false if @nodes == 0
    container = false
    counter = self.size
    mark = self.head
    while counter > 0
      if mark.value == value
        container = true
      end
      break if container == true
      mark = mark.send :next
      counter -= 1
    end
    return container
  end

  def find(data)
    #returns index of the node containing data (or nil if not found)
    counter = 1
    index = nil
    mark = self.head
    while counter <= self.size
      if mark.value == data
        index = counter
      end
      break if index != nil
      mark = mark.send :next
      counter += 1
    end
    return index
  end

  def to_s
    #represents linkedlist objects as strings so they may be printed out and previewed in the console
    #should be formated as (data)->(data)->(data)->nil
    counter = 1
    mark = self.head
    while counter <= self.size
      if counter == self.size
        print "(#{mark.value})->nil"
      else
        print "(#{mark.value})->"
      end
      mark = mark.send :next
      counter += 1
    end
  end

  #the methods below are extra credit

  def insert_at(index)
    #inserts the data at the given index
  end

  def remove_at(index)
    #removes the node at the given index
  end

end


class Node
  attr_accessor :next, :value

  def initialize
    @next = nil
    @value = nil
  end

  def value
    @value
  end

  def next
    @next
  end

end
