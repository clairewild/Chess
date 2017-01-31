require_relative "piece.rb"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    self.populate_grid
  end

  def populate_grid
    (2..5).each do |row|
      @grid[row].each_index do |col|
        pos = [row, col]
        self[pos] = NullPiece.new
      end
    end
    @grid[1].each_index { |col| @grid[1][col] = Piece.new(:white) }
    @grid[6].each_index { |col| @grid[6][col] = Piece.new(:blue) }

    @grid[0].each_index { |col| @grid[0][col] = Piece.new(:white) }
    @grid[7].each_index { |col| @grid[7][col] = Piece.new(:blue) }
  end

  def move_piece(start_pos, end_pos)
    if valid_move?(start_pos, end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
  end

  def valid_move?(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise "No piece in this position. Please choose a piece to move"
    # elsif self[start_pos].color == self[end_pos].color
    #   raise "Friendly fire! You can't take your own piece"
    end
    valid_pos?(start_pos) && valid_pos?(end_pos)
  end

  def valid_pos?(pos)
    row, col = pos
    row > -1 && col > -1 && row < 8 && col < 8
  end

  def size
    @grid.length
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

end
