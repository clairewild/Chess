require_relative "required.rb"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    self.populate_grid
  end

  def populate_grid
    load_null
    load_pawns(1, :blue)
    load_pawns(6, :white)
    load_pieces(0, :blue)
    load_pieces(7, :white)
  end

  def load_null
    (2..5).each do |row|
      @grid[row].each_index do |col|
        pos = [row, col]
        self[pos] = NullPiece.instance
      end
    end
  end

  def load_pieces(row, colour)
    self[[row, 0]] = Rook.new(colour, [row,0], self)
    self[[row, 1]] = Knight.new(colour, [row,1], self)
    self[[row, 2]] = Bishop.new(colour, [row,2], self)
    self[[row, 4]] = Queen.new(colour, [row,4], self)
    self[[row, 3]] = King.new(colour, [row,3], self)
    self[[row, 5]] = Bishop.new(colour, [row,5], self)
    self[[row, 6]] = Knight.new(colour, [row,6], self)
    self[[row, 7]] = Rook.new(colour, [row,7], self)
  end

  def load_pawns(row, colour)
    @grid[row].each_index { |col| @grid[row][col] = Pawn.new(colour, [row,col], self) }
  end

  def move_piece(start_pos, end_pos)
    # if valid_move?(start_pos, end_pos)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
      self[start_pos].position = start_pos
      self[end_pos].position = end_pos
    # end
  end

  def valid_move?(start_pos, end_pos)
    if self[start_pos].is_a?(NullPiece)
      raise "No piece in this position. Please choose a piece to move"
    # elsif self[start_pos].color == self[end_pos].color
    #   raise "Friendly fire! You can't take your own piece"
    elsif start_pos == end_pos
      return false
    end
    valid_pos?(start_pos) && valid_pos?(end_pos)
  end

  def valid_pos?(pos)
    row, col = pos
    row > -1 && col > -1 && row < 8 && col < 8
  end

  def in_check?(colour)
    king = find_king(colour)
    @grid.each_with_index do |el, row|
      el.each_index do |col|
        pos = [row, col]
        piece = self[pos]
        unless piece.colour == colour || piece.colour.nil?
          # return true if piece.valid_moves.include?(king.position)
          if piece.moves.include?(king.position) && valid_move?(piece.position, king.position)
            return true
          end         
        end
      end
    end
    false
  end

  def checkmate?(colour)
    king = find_king(colour)
    in_check?(colour) && king.valid_moves.empty?
  end

  def find_king(colour)
    @grid.each_with_index do |el, row|
      el.each_index do |col|
        pos = [row, col]
        return self[pos] if self[pos].is_a?(King) && self[pos].colour == colour
      end
    end
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
