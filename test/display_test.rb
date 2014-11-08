gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/display'

class DisplayTest < Minitest::Test

  def test_displays_initial_text
    display = Display.new
    # intro = display.intro
    assert_equal "Welcome to MASTERMIND", display.intro
  end
end
