class Board
  attr_reader :layout, :guess, :possibilities

  def initalize()

  end



  def generate
    @layout = []
    4.times { @layout << ["r", "g", "b", "y"].sample }
    @layout
  end

  def check_correct_positions(guess)
    count = 0
    layout.length.times { |i| count += 1 if @layout[i] == guess[i] }
    count
  end

  def check_correct_colors(guess)
    correct_colors = 0
    ["r", "g", "b", "y"].each do |element|
      correct_colors = correct_colors + [guess_count(guess)[element], layout_count[element]].min
    end
    puts correct_colors
  end

  def layout_count
    layout_counts = Hash.new(0)
    layout.map { |letter| layout_counts[letter] = layout.count(letter) }
    layout_counts
  end

  def guess_count(guess)
    guess_counts = Hash.new(0)
    guess.map { |letter| guess_counts[letter] = guess.count(letter) }
    guess_counts
  end
end


board = Board.new
board.generate
guess = ["r","g","b","y"]
# board.submit_guess(guess)
puts board.check_correct_positions(guess)
puts "Layout Hash: #{board.layout_count}"
puts "Guess Hash: #{board.guess_count(guess)}"
board.check_correct_colors(guess)
