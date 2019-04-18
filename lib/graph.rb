require "./lib/vertex.rb"

class Graph
  attr_accessor :vertices
  def initialize
    @vertices = []
  end

  def root
    @vertices.first
  end

  def to_s
    str = ""
    vertices.each do |vertex|
      str << vertex.value.to_s
      vertex.edges.each { |edge| str << edge.value.to_s }
      str << "\n" unless vertex.value == vertices.last.value
    end

    str
  end

  def add_vertex(vertex)
    @vertices << vertex
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

  # find shortest path using breadth first search
  def find_shortest_path(graph, end_position)
    queue = [graph.root]
    until queue.empty?
      temp = queue.pop
      temp.visited = true
      return temp if temp.value == end_position
      temp.edges.each {|edge| queue.unshift(edge) unless edge.visited}
    end
  end

  # backtrack through vertex parents to build the path
  def show_path(target_vertex)
    path = []
    queue = [target_vertex]
    until queue.empty?
      temp = queue.pop
      path << temp.value
      queue << temp.parent unless temp.parent.nil?
    end
    path.reverse
  end

end