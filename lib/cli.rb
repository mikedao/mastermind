require 'game'
require 'messages'

class CLI
  attr_reader :command, :instream, :outstream

  def initialize(instream, outstream)
    @command   = ""
    # @messages  = Messages.new
    @instream  = instream
    @outstream = outstream
  end

  def call
    outstream.puts Messages.clear_screen
    outstream.puts Messages.intro
    until finished?
      outstream.puts Messages.command_request
      print "> "
      @command = instream.gets.strip
      process_initial_commands
    end
    # outstream.puts Messages.game_quit
    abort
  end

  private

  def process_initial_commands
    case
    when finished?
      outstream.puts Messages.game_quit
    when play?
      game = Game.new(instream, outstream)
      game.play
    when instructions?
      outstream.puts Messages.game_instructions
    else
      outstream.puts Messages.not_a_valid_command
    end
  end

  def play?
    command == "p"
  end

  def instructions?
    command == "i"
  end

  def finished?
    command == "q" || command == "quit"
  end
end
