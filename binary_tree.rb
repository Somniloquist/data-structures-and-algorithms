#!/usr/bin/env ruby
require "./node.rb"

class Tree
  attr_accessor :root
  def initialize(root)
    @root = root
  end
end

def build_tree(array)
  # get our root node
  tree = Tree.new(Node.new(array.shift))
  count = 0
  array.each do |value|
    current_node = tree.root
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

  tree
end

data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = build_tree(data)
p tree