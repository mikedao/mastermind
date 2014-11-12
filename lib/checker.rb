module Checker

  def self.not_a_valid_guess?(guess)
    guess.size != 4
  end

  def self.win?(layout, guess)
    guess == layout
  end

  def self.exit?(command)
    command == "q" || command == "quit"
  end

  def self.not_valid_answer?(guess, valid_colors)
    !(guess.all? { |char| valid_colors.include? char } && guess.size == 4)
  end

  def self.correct_positions(layout, answer)
    (0..layout.length-1).select do |i|
      layout[i] == answer[i]
    end.size
  end

  def self.correct_colors(layout, answer)
    all_correct_colors(layout, answer) - correct_positions(layout, answer)
  end

  def self.all_correct_colors(layout, answer)
    Board::COLORS.inject(0) do |correct_colors, color|
      correct_colors + color_matches(color, layout, answer)
    end
  end

  def self.color_matches(color, layout, answer)
    [calculate_hash(layout)[color], calculate_hash(answer)[color]].min
  end

  def self.calculate_hash(start)
    outgoing_hash = Hash.new(0)
    start.map { |element| outgoing_hash[element] += 1 }
    outgoing_hash
  end

end
