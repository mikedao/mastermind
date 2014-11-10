gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/display'

class DisplayTest < Minitest::Test

  def test_displays_initial_text
    assert_equal "Welcome to MASTERMIND", Display.intro
  end

  def test_print_instructions_works

    assert_equal "I have selected a secret combination of colors(Red (r), Green (g), Blue (b) and Yellow (y)). Guess the combination to win. I will tell you how many of your colors are in the right position. I will also tell you how many colors are in the wrong position.", Display.print_instructions
  end

  def test_initial_instructions
    assert_equal "Would you like to (p)lay, read the (i)nstructions, or (q)uit?", Display.initial_instructions
  end


end
