require_relative 'test_helper'
require 'messages'

class MessagesTest < Minitest::Test

  def test_intro
    assert Messages.intro.include?("Welcome")
  end
end
