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
