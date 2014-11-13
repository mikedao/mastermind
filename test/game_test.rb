require_relative 'test_helper'

class GameTest < Minitest::Test

  def test_turn_value_when_initialized
    game = Game.new($stdin,$stdout)
    assert_equal 0, game.turns
  end

end
