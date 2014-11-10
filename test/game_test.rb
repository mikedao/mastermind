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

  def test_timer_starts_when_game_starts
    game = Game.new
    game.game_start
    assert game.timer.current_elapsed_time
  end

  def test_turns_is_0_when_game_starts
    game = Game.new
    game.game_start
    assert_equal 0, game.turns
  end

  def test_position_checker_works
    game = Game.new
    game.game_start
    assert_equal 4, game.correct_positions(["r", "g", "b", "y"],["r", "g", "b", "y"])
    assert_equal 3, game.correct_positions(["r", "g", "b", "y"],["r", "g", "b", "r"])
    assert_equal 2, game.correct_positions(["r", "g", "b", "y"],["r", "g", "r", "r"])
    assert_equal 1, game.correct_positions(["r", "g", "b", "y"],["r", "r", "r", "r"])
    assert_equal 0, game.correct_positions(["b", "g", "b", "y"],["r", "r", "r", "r"])
  end

  def test_did_i_win_works
    game = Game.new
    game.game_start
    assert game.did_i_win?(["r", "g", "b", "y"],["r", "g", "b", "y"])
    assert game.did_i_win?(["r", "g", "y", "b"],["r", "g", "y", "b"])
    refute game.did_i_win?(["b", "g", "b", "y"],["r", "r", "r", "r"])
  end
end
