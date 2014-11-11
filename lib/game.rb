require 'board'
require 'timer'
require 'checker'
class Game
  attr_reader :guess,
              :turns,
              :layout,
              :messages,
              :command,
              :instream,
              :outstream,
              :timer

  def initialize(instream, outstream)
    @guess          = 0
    @turns          = 0
    @layout         = Board.new.layout
    # @messages       = messages
    @command        = ""
    @instream       = instream
    @outstream      = outstream
    @timer          = Timer.new
  end

  def play
    outstream.puts @layout.join
    outstream.puts Messages.game_intro
    until Checker.win?(layout, guess) || Checker.exit?(command)
      outstream.puts Messages.turn_indicator(turns, timer.current_elapsed_time)
      outstream.puts Messages.game_command_request
      print "> "
      @command = instream.gets.strip
      @guess   = command.downcase.split('')
      process_game_turn
    end
  end

  private

  def process_game_turn
    add_turn
    puts Messages.guess_status(Checker.correct_positions(layout, guess),
      Checker.correct_colors(layout, guess))
    case
    when Checker.exit?(command)
      outstream.puts Messages.game_quit
      abort
    when Checker.win?(layout, guess)
      timer.end_timer
      puts "Layout #{layout.join}"
      puts "Turns #{turns}"
      puts "Time Elapsed #{timer.time_elapsed}"
      outstream.puts Messages.game_win(layout.join.upcase, turns, timer.time_elapsed)
    when Checker.not_a_valid_guess?(guess)
      outstream.puts Messages.not_a_valid_guess
    end
  end

  def add_turn
    @turns += 1
  end


end
