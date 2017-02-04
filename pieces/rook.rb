require_relative 'slideable.rb'
require_relative 'piece.rb'

class Rook < Piece
  include SlidingPiece

  def initialize(colour, pos, board)
    @symbol = "R"
    super
  end

  def move_dirs
    HORIZONTAL + VERTICAL
  end

end
