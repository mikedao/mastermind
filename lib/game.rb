require 'board'
require 'timer'
require 'checker'
require 'highscore'

class Game
  attr_reader :guess,
              :turns,
              :layout,
              :messages,
              :command,
              :instream,
              :outstream,
              :timer,
              :highscore



  def initialize(instream, outstream)
    @guess          = ""
    @turns          = 0
    @layout         = Board.new.layout
    @command        = ""
    @instream       = instream
    @outstream      = outstream
    @timer          = Timer.new
    @highscore      = Highscore.new(instream, outstream,'highscore.csv')
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
      puts Messages.guess_status(Checker.correct_positions(layout, guess),
        Checker.correct_colors(layout, guess)) unless Checker.not_valid_answer?(guess, Board::COLORS)
      process_game_turn
    end
  end

  private

  def process_game_turn
    add_turn
    case
    when Checker.exit?(command)
      outstream.puts Messages.game_quit
      abort
    when Checker.win?(layout, guess)
      timer.end_timer
      outstream.puts Messages.game_win(layout.join.upcase, turns, timer.time_elapsed)
      puts "What is your name?"
      print "> "
      name = instream.gets.strip
      highscore.do_high_scores(name,layout.join.upcase, turns, timer.time_elapsed)
      outstream.puts Messages.program_instructions
    when Checker.not_valid_answer?(guess, Board::COLORS)
      outstream.puts Messages.not_a_valid_guess
    end
  end

  def add_turn
    @turns += 1
  end

end
