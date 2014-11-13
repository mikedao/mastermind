require_relative 'test_helper'
require 'messages'

class MessagesTest < Minitest::Test

  def test_intro
    assert Messages.intro.include?("WELCOME")
  end

  def test_program_instructions
    assert Messages.program_instructions.include?("for instructions")
  end

  def test_command_request
    assert Messages.command_request.include?("Enter")
  end

  def test_game_instructions
    assert Messages.game_instructions.include?("secret")
  end

  def test_game_intro
    assert Messages.game_intro.include?("initialized")
  end

  def test_game_command_request
    assert Messages.game_command_request.include?("guess")
  end

  def test_game_quit_message
    assert Messages.game_quit.include?("Exiting")
  end

  def test_not_valid_guess
    assert Messages.not_a_valid_guess.include?("guess is not valid")
  end

end
