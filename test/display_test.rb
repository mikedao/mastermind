gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/display'

class DisplayTest < Minitest::Test

  def test_displays_initial_text
    display = Display.new
    assert_equal "Welcome to MASTERMIND", display.intro
  end

  def test_print_instructions_works
    display = Display.new
    assert_equal "I have selected a secret combination of colors(Red (r), Green (g), Blue (b) and Yellow (y)). Guess the combination to win. I will tell you how many of your colors are in the right position. I will also tell you how many colors are in the wrong position.", display.print_instructions
  end

end
