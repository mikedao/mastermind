require_relative 'board'
require_relative 'display'
require_relative 'timer'

class Game
  attr_reader :board, :timer, :turns

  def game_start
    @board = Board.new
    @timer = Timer.new
    @turns = 0
    Display.clear_screen
    puts @board.layout.join
    puts Display.first_turn
  end

  def play
    loop do
      puts Display.what_guess(@timer.current_elapsed_time)
      answer = gets.chomp.downcase.split('')
      if answer[0] == 'q'
        puts Display.end_game
        abort
      elsif answer.size == 4
        @turns += 1
        puts Display.evaluated_guess(correct_positions(@board.layout, answer), correct_colors(@board.layout, answer), @turns)
        winner(answer) if did_i_win?(@board.layout, answer)
      else
        puts "Please enter an answer or 'q'"
      end
    end
  end

  def correct_positions(layout, answer)
    count = 0
    layout.length.times { |i| count += 1 if layout[i] == answer[i] }
    count
  end

  def correct_colors(layout, answer)
    correct_colors = 0
    ["r", "g", "b", "y"].map { |key|
      correct_colors += [calculate_hash(layout)[key], calculate_hash(answer)[key]].min }
      correct_colors - correct_positions(layout, answer)
  end

  def calculate_hash(start)
    outgoing_hash = Hash.new(0)
    start.map { |element| outgoing_hash[element] += 1 }
    outgoing_hash
  end

  def did_i_win?(layout, answer)
    correct_positions(layout, answer) == 4 && correct_colors(layout, answer) == 0
  end

  def winner(layout)
    @timer.end_timer
    puts Display.win(layout, @turns, @timer.time_elapsed)
    ask_play_again
  end

  def ask_play_again
    loop do
      puts Display.play_again
      answer = gets.chomp.downcase
      case answer
      when 'p'
        Display.clear_screen
        game_start
        play
      when 'q'
        puts Display.end_game
        abort
      end
    end
  end

end
