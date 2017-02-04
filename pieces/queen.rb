require_relative 'slideable.rb'
require_relative 'piece.rb'

class Queen < Piece
  include SlidingPiece

  def initialize(colour, pos, board)
    @symbol = "Q"
    super
  end

  def move_dirs
    HORIZONTAL + VERTICAL + DIAGONAL
  end

end
