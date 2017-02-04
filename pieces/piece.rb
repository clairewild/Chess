require "singleton"

class Piece
  attr_accessor :position
  attr_reader :colour, :symbol

  def initialize(colour, pos, board) # colour = :white or :black or nil
    @colour = colour
    @position = pos
    @board = board
  end

  def moves
    move_dirs.map do |dx, dy|
      row, col = @position
      [row + dx, col + dy]
    end
  end

  def valid_moves
    moves.select do |move|
      @board.valid_move?(position, move) && !move_into_check?(move)
    end
  end

  def move_into_check?(end_pos)
    start_pos = position
    @board.move_piece(start_pos, end_pos)
    res = @board.in_check?(colour)
    @board.move_piece(end_pos, start_pos)
    res
  end

  def other_colour
    colour == :white ? :blue : :white
  end

end

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = "_"
    super(nil, nil, nil)
  end

end
