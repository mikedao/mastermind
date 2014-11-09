require_relative 'board'
require_relative 'display'
class Game
  attr_reader :board
  def initialize()
  end

  def game_start
    @board = Board.new
    @board.generate
  end

end

puts Display.intro
