class Node
  attr_accessor :value, :parent, :left_child, :right_child
  def initialize(value, parent = nil, left_child = nil, right_child = nil)
    @value = value
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end

  def to_s
    "value: #{value}, parent: #{parent.value}, left_child: #{left_child.value}, right_child: #{right_child.value}"
  end
end