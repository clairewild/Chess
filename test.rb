require_relative "board.rb"
require_relative "cursor.rb"
require_relative "piece.rb"
require_relative "display.rb"

pos = [0,0]

board = Board.new
cursor = Cursor.new(pos, board)
show = Display.new(board, cursor)

show.render
