class Piece
  attr_reader :symbol

  def initialize(colour) # colour = :white or :black or nil
    @colour = colour
    @position = pos ## initiaize w/ a position!!!
    @symbol = "Q"
    @board = ## initialize w/ a board!
  end

  def colour
    @colour
  end

  def moves
    res = []
  end

  module SlidingPiece

    def move_dirs

    end

  end

  module SteppingPiece

  end

end

class NullPiece < Piece

  def initialize
    super(nil)
    @symbol = " "
  end

end

class Bishop < Piece
  include SlidingPiece

end

class Rook < Piece
  include SlidingPiece

end

class Queen < Piece
  include SlidingPiece

end

class King < Piece
  include SteppingPiece

end

class Knight < Piece
  include SteppingPiece

end
