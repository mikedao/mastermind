gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test

  def test_board_created_when_game_started
    game = Game.new
    game.game_start
    puts "New game board layout: #{game.board.layout}"
    assert game.board.layout
  end


end
