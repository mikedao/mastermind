require 'board'
require 'timer'
require 'checker'
require 'highscore'
require 'history'


class Game
  attr_reader :guess,
              :turns,
              :layout,
              :messages,
              :command,
              :instream,
              :outstream,
              :timer,
              :highscore,
              :history,
              :log



  def initialize(instream, outstream)
    @guess          = ""
    @turns          = 0
    @layout         = Board.new.layout
    @command        = ""
    @instream       = instream
    @outstream      = outstream
    @timer          = Timer.new
    @highscore      = Highscore.new(instream, outstream,'highscore.csv')
    @log            = []
    @history        = History.new(instream, outstream, @log)
  end

  def play
    outstream.puts @layout.join
    outstream.puts Messages.game_intro.colorize(:blue)
    until Checker.win?(layout, guess) || Checker.exit?(command)
      pre_process
      process_game_turn
    end
  end

  private

  def pre_process
    outstream.print Messages.game_command_request(turns, timer.current_elapsed_time)
    @command = instream.gets.strip
    @guess = command.downcase.split('')
    @log << @guess.join if !Checker.not_valid_answer?(guess, Board::COLORS)
    outstream.puts Messages.guess_status(Checker.correct_positions(layout, guess),
      Checker.correct_colors(layout, guess)) unless Checker.not_valid_answer?(guess, Board::COLORS)
  end

  def process_game_turn
    add_turn
    history.display(@log)
    case
    when Checker.exit?(command)
      outstream.puts Messages.game_quit
      abort
    when Checker.win?(layout, guess)
      win_process
    when Checker.not_valid_answer?(guess, Board::COLORS)
      outstream.puts Messages.not_a_valid_guess
    end
  end

  def win_process
    timer.end_timer
    outstream.puts Messages.game_win(layout.join.upcase, turns, timer.time_elapsed)
    outstream.print "What is your name?\n > "
    name = instream.gets.strip
    highscore.do_high_scores(name,layout.join.upcase, turns, timer.time_elapsed)
    outstream.puts Messages.program_instructions
  end


  def add_turn
    @turns += 1
  end

end
