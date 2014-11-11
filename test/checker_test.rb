require_relative 'test_helper'
require 'checker'

class CheckerTest < Minitest::Test

  def test_not_a_valid_test
    refute Checker.not_a_valid_guess?("rbrr")
    assert Checker.not_a_valid_guess?("rbrrrr")
  end

  def test_win_works
    refute Checker.win?("rrrr","yyyy")
    assert Checker.win?("bbbb","bbbb")
  end

  def test_exit_worls
    assert Checker.exit?("q")
    assert Checker.exit?("quit")
    refute Checker.exit?("quits")
    refute Checker.exit?("yyy")
  end

  def test_correct_positions_works
    a = %w(r b y y)
    b = %w(r b y y)
    assert_equal 4, Checker.correct_positions(a,b)

    a = %w(r r y y)
    b = %w(r r y b)
    assert_equal 3, Checker.correct_positions(a,b)

    a = %w(r r y y)
    b = %w(b b r r)
    assert_equal 0, Checker.correct_positions(a,b)
  end

  def test_correct_colors_works
    assert_equal 0, Checker.correct_colors(["r", "g", "b", "y"],["r", "g", "b", "y"])
    assert_equal 1, Checker.correct_colors(["r", "r", "y", "y"],["y", "b", "b", "b"])
    assert_equal 1, Checker.correct_colors(["r", "r", "y", "y"],["r", "b", "b", "r"])
  end

  def test_calculate_hash

    hash = {"r"=>1, "g"=>1, "b"=>1, "y"=>1}
    assert_equal hash , Checker.calculate_hash(["r", "g", "b", "y"])
    hash = {"r"=>4, "g"=>0, "b"=>0, "y"=>0}
    assert_equal hash["b"] , Checker.calculate_hash(["r", "r", "r", "r"])["b"]
    assert_equal hash["g"] , Checker.calculate_hash(["r", "r", "r", "r"])["g"]
    assert_equal hash["y"] , Checker.calculate_hash(["r", "r", "r", "r"])["y"]
  end

end
