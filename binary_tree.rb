#!/usr/bin/env ruby
require "./node.rb"
require "./tree.rb"


data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(data)
bfs = tree.breadth_first_search(4)
puts bfs
dfs = tree.depth_first_search(4)
puts dfs
dfs = tree.depth_first_search(99)
puts dfs