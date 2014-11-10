gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/display'

class DisplayTest < Minitest::Test

  def test_displays_initial_text
    assert_equal "Welcome to MASTERMIND", Display.intro
  end

  def test_print_instructions

    assert_equal "I have selected a secret combination of colors(Red (r), Green (g), Blue (b) and Yellow (y)). Guess the combination to win. I will tell you how many of your colors are in the right position. I will also tell you how many colors are in the wrong position.\n", Display.print_instructions
  end

  def test_initial_instructions
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n", Display.initial_instructions
  end

  def test_first_turn
    assert_equal "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.", Display.first_turn
  end

  def test_what_guess
    assert_equal "Time elapsed: 60 seconds. What is your guess?", Display.what_guess(60)
    assert_equal "Time elapsed: 100 seconds. What is your guess?", Display.what_guess(100)
  end

  def test_evaluated_guess
    assert_equal "You have 4 in the right position and 0 in the wrong position.\n", Display.evaluated_guess(4,0)
  end

  def test_win
    assert_equal "YOU HAVE WON THE GAME.\n Your winning guess was rrrr, you took 5 turns, and you did it in 1 minute and 40 seconds. ", Display.win(["r","r","r","r"], 5, 100)
    assert_equal "YOU HAVE WON THE GAME.\n Your winning guess was bbbb, you took 10 turns, and you did it in 3 minutes and 20 seconds. ", Display.win(["b","b","b","b"], 10, 200)
  end

  def test_end_game
    assert_equal "GOODBYE", Display.end_game
  end

  def test_play_again
    assert_equal "Do you want to (p)lay again or (q)uit?", Display.play_again
  end

end
