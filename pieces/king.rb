require_relative 'piece.rb'
require_relative 'stepable.rb'

class King < Piece
  include SteppingPiece

  MOVES = [[1,1], [1,0], [1,-1], [0,-1], [-1,-1], [-1,0], [-1,1], [0,1]]

  def initialize(colour, pos, board)
    @symbol = "K"
    super
  end

  def move_dirs
    MOVES
  end

end
