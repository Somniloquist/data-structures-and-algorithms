require './lib/graph'

class ChessBoard < Graph
  def valid_move(coordinates)
    coordinates.each {|n| return false unless n.between?(0,7)}
    true
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
