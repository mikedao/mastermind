gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test

  def test_random_board_generates_easy_four
    game = Game.new
    assert_equal 4, game.generate_board.size
  end

end
