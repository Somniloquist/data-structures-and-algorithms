class Vertex
  attr_accessor :visited, :parent
  attr_reader :value, :edges
  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @edges = []
    @visited = false
  end

  def add_edge(vertex)
    @edges << vertex
  end
end
