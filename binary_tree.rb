#!/usr/bin/env ruby
require "./node.rb"
require "./tree.rb"


data = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(data)
puts("bfs".ljust(75, "="))
bfs = tree.breadth_first_search(4)
puts bfs
puts("dfs".ljust(75, "="))
dfs = tree.depth_first_search(4)
puts dfs
puts("dfs_rec".ljust(75, "="))
dfs = tree.dfs_rec(4)
puts dfs
dfs = tree.dfs_rec(9)
puts dfs