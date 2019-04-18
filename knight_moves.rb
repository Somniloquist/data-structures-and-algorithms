#!/usr/bin/env ruby
require "./lib/chessboard.rb"

def knight_moves(start_position, end_position)
  graph = Graph.new.build(start_position, end_position)
  path = show_path(find_shortest_path(graph, end_position))
  path
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

def valid_move(coordinates)
  coordinates.each {|n| return false unless n.between?(0,7)}
  true
end

p knight_moves([7,7],[0,0])