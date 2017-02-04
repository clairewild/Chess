require_relative 'piece.rb'
require_relative 'stepable.rb'

class Pawn < Piece
  include SteppingPiece

  MOVES = [[1,0], [2,0], [-1,1], [1,1]]

  def initialize(colour, pos, board)
    @symbol = "P"
    super
  end

  def move_dirs
    MOVES
  end

end
