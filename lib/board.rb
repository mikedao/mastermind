class Board
  attr_reader :layout, :guess, :possibilities

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
    correct_colors - check_correct_positions(guess)
  end

  def layout_count
    layout_counts = Hash.new(0)
    layout.each { |letter| layout_counts[letter] = layout.count(letter) }
    layout_counts
  end

  def guess_count(guess)
    guess_counts = Hash.new(0)
    guess.map { |letter| guess_counts[letter] = guess.count(letter) }
    guess_counts
  end
end
