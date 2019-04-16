require './lib/graph'

class ChessBoard < Graph
  def initialize
    super
    build
  end

  private
  def build
    # (8*8).times { |i| add_vertex(Vertex.new(i+1)) }
  end
end

class ChessPiece
  attr_reader :routes
  def initialize
    @routes = []
  end
end

class Knight < ChessPiece
  def initialize
    @routes = [
      [-1,2], [-2,1], # up/right
      [2,1], [1,2], # down/right
      [2,-1], [1,-2], # down/left
      [-2,-1], [-1,-2] # up/left
    ]
  end
end
