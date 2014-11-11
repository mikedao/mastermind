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

  def self.correct_positions(layout, answer)
    (0..layout.length-1).select do |i|
      layout[i] == answer[i]
    end.size
  end

  def self.correct_colors(layout, answer)
    correct_colors = 0
    ["r", "g", "b", "y"].map do |key|
      correct_colors += [calculate_hash(layout)[key],
      calculate_hash(answer)[key]].min
    end
      correct_colors - correct_positions(layout, answer)
  end

  def self.calculate_hash(start)
    outgoing_hash = Hash.new(0)
    start.map { |element| outgoing_hash[element] += 1 }
    outgoing_hash
  end

end
