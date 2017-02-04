require_relative 'piece.rb'
require_relative 'slideable.rb'

class Bishop < Piece
  include SlidingPiece

  def initialize(colour, pos, board)
    @symbol = "B"
    super
  end

  def move_dirs
    DIAGONAL
  end

end
