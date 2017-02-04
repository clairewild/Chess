require_relative 'piece.rb'
require_relative 'stepable.rb'

class Knight < Piece
  include SteppingPiece

  MOVES = [[-1,2], [1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1]]

  def initialize(colour, pos, board)
    @symbol = "H"
    super
  end

  def move_dirs
    MOVES
  end

end
