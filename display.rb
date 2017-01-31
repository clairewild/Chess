require_relative "board.rb"
require_relative "cursor.rb"
require_relative "piece.rb"

require 'byebug'
require "colorize"

class Display
  attr_reader :board, :cursor

  def initialize(board, cursor)
    @board = board
    @cursor = cursor
  end

  def render
    system("clear")
    puts "  #{(0...board.size).to_a.join(" ")}"
    (0...board.size).each do |i|
      puts "#{i} #{row_to_s(i)}"
    end
  end

  def display
    while true
      render
      cursor.get_input
    end
  end

  def row_to_s(i)
    row = board.grid[i]
    row = row.map.with_index do |piece, j|
      pos = [i, j]
      if pos == cursor.cursor_pos
        piece.symbol.colorize(:red)
      else
        piece.symbol.colorize(piece.colour)
      end
    end
    row.join(" ")
  end

end

if __FILE__ == $PROGRAM_NAME
  pos = [0,0]

  p board = Board.new
  p cursor = Cursor.new(pos, board)
  show = Display.new(board, cursor)

  show.display
end
