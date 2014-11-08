gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_player_has_a_name
    player = Player.new("Mike")
    assert_equal "Mike", player.name
  end
end
