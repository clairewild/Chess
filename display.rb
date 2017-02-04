require "colorize"

class Display
  attr_reader :board, :cursor

  def initialize(board, cursor)
    @board = board
    @cursor = cursor
    @flag = true
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
      pos = cursor.cursor_pos
      unless board[pos].is_a?(NullPiece)
        print board[pos].valid_moves if @flag
        sleep(10)
      end
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
