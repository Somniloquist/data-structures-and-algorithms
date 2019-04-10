class Graph
  attr_accessor :vertices
  def initialize
    @vertices = []
  end

  def length
    @vertices.length
  end

  private
  def add_vertex(vertex)
    @vertices << vertex
  end

end

class ChessBoard < Graph
  def initialize
    super
    build
  end

  private
  def build
    (8*8).times { |i| add_vertex(Vertex.new(i+1)) }
  end
end
