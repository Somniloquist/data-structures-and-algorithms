class Tree
  attr_accessor :root
  def initialize(array)
    @root = Node.new(array.shift)
    build_tree(array)
  end

  def breadth_first_search(value)
    queue = [root]
    until queue.empty?
      temp = queue.pop
      return temp if temp.value == value
      queue.unshift(temp.left_child) unless temp.left_child.nil?
      queue.unshift(temp.right_child) unless temp.right_child.nil?
    end

    nil
  end

  def depth_first_search(value)
    stack = [root]
    visited = []
    until stack.empty?
      temp = stack[-1]
      if visited.include?(temp)
        return temp if temp.value == value
        stack.pop
      else
        # this order ensures that the left child is higher on the stack
        stack << temp.right_child unless temp.right_child.nil?
        stack << temp.left_child unless temp.left_child.nil?
        visited << temp
      end
    end

    nil
  end

  def dfs_rec(value, node = root)
    return if node.nil?
    left = dfs_rec(value, node.left_child)
    right = dfs_rec(value, node.right_child)
    return left if !left.nil? && left.value == value
    return right if !right.nil? && right.value == value
    node
  end

  private
  def build_tree(array)
    array.each do |value|
      current_node = root
      loop do 
        if value >= current_node.value
          if current_node.right_child.nil?
            current_node.right_child = Node.new(value, current_node)
            break
          else
            current_node = current_node.right_child
          end
        else
          if current_node.left_child.nil?
            current_node.left_child = Node.new(value, current_node)
            break
          else
            current_node = current_node.left_child
          end
        end
      end
    end
  end

end
