require_relative 'test_helper'

class GameTest < Minitest::Test

  def test_add_turn
    skip
    # HOW DO YOU TEST A PRIVATE METHOD
    game = Game.new($stdin,$stdout)
    game.add_turn
    assert_equal 1,
  end

end
