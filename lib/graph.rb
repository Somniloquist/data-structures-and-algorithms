require "./lib/vertex.rb"

class Graph
  attr_accessor :vertices
  def initialize
    @vertices = []
  end

  def length
    @vertices.length
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
          temp = Vertex.new(possible_move, current_vertex)
          current_vertex.add_edge(temp)
          queue.unshift(temp)
        end
      end

      add_vertex(current_vertex)
      visited << current_vertex.value
      break if current_vertex.value == end_position
    end
    
    #DUBUG
    # puts "after"
    # puts_queue(queue)
    # puts_visited(visited)

    self
  end

  private
  # debugging stuff
  def puts_queue(queue)
    print("queue: ")
    queue.each do |vertex|
      print("#{vertex.value} ")
    end
    puts ""
  end

  def puts_visited(visited)
    print("visited: ")
    p visited
  end


end