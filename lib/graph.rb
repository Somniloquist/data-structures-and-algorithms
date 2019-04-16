require "./lib/vertex.rb"

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