class Vertex
  attr_reader :value
  def initialize(value)
    @value = value
    @neighbors = []
  end

  def add_neighbor(vertex)
    @neighbors << vertex
  end
end
