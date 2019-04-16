class Vertex
  attr_reader :value
  def initialize(value)
    @value = value
    @edges = []
  end

  def add_edge(vertex)
    @edges << vertex
  end
end
