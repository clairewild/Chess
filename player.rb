require "cursor.rb"

class HumanPlayer

  attr_reader :name, :colour

  def initialize(name, colour, cursor)
    @name = name
    @colour = colour
  end

  def get_move
    prompt
    start_pos = nil

    while start_pos.nil?
      start_pos = @cursor.get_input
    end

    prompt
    end_pos = nil
    
    while end_pos.nil?
      end_pos = @cursor.get_input
    end

    [start_pos, end_pos]

  end

end
