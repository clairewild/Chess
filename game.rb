require_relative "board.rb"
require_relative "cursor.rb"
require_relative "display.rb"
require_relative "player.rb"

class Game

  def initialize(name1, name2)
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
    @display = Display.new(@board, @cursor)
    @player1 = HumanPlayer.new(name1, :white, @cursor)
    @player2 = HumanPlayer.new(name2, :blue, @cursor)
    @current_player = @player1
  end

  def play
    until won?
      play_turn
      switch_player
    end
  end

  def play_turn
    #check if valid move
    start_pos, end_pos = @current_player.get_move

    if @board.valid_move?(start_pos, end_pos)
      move_piece(start_pos, end_pos)
    else
      raise "TRY AGAIN"
      retry
    end

  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def won?
    @board.checkmate?(@player.colour)

  end









end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
