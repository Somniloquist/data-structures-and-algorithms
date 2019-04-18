require './lib/graph'

class ChessBoard < Graph
  def valid_move(coordinates)
    coordinates.each {|n| return false unless n.between?(0,7)}
    true
  end

  def build(start_position, end_position)
    queue = [Vertex.new(start_position)]
    visited = []
    knight = Knight.new
    until queue.empty?
      current_vertex = queue.pop

      next if visited.include?(current_vertex.value)
      knight.routes.each do |y,x|
        possible_move = [current_vertex.value[0] + y, current_vertex.value[1] + x]
        if valid_move(possible_move)
          # keep track of the new vertex's parent for backtracking
          temp = Vertex.new(possible_move, current_vertex)
          current_vertex.add_edge(temp)
          queue.unshift(temp)
        end
      end

      add_vertex(current_vertex)
      visited << current_vertex.value
      break if current_vertex.value == end_position
    end

    self
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
