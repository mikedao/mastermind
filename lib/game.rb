require_relative 'board'
class Game

  def initialize()

  end

  def generate_board
    board = Board.new
    board.generate
    board.layout
  end
end
