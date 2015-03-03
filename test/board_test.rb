require_relative 'test_helper'

class BoardTest < Minitest::Test

  def test_board_generation_generates_four
    board = Board.new
    assert_equal 4,board.layout.size
  end

  def test_generate_will_generate_different_layouts
    board = Board.new
    board1 = board.layout
    board = Board.new
    board2 = board.layout
    refute board1 == board2
  end

end
