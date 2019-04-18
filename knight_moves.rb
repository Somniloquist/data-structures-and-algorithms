#!/usr/bin/env ruby
require "./lib/chessboard.rb"

def knight_moves(start_position, end_position)
  board = ChessBoard.new.build(start_position, end_position)
  board.show_path(board.find_shortest_path(board, end_position))
end

p knight_moves([0,0],[1,2])
p knight_moves([0,0],[4,2])
p knight_moves([4,2],[2,4])
p knight_moves([7,7],[0,0])