module Display

  def self.intro
    "Welcome to MASTERMIND"
  end

  def self.print_instructions
    "I have selected a secret combination of colors(Red (r), Green (g), Blue (b) and Yellow (y)). Guess the combination to win. I will tell you how many of your colors are in the right position. I will also tell you how many colors are in the wrong position.\n"
  end

  def self.initial_instructions
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end

  def self.first_turn
    "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def self.what_guess(time_elapsed)
    "Time elapsed: #{time_elapsed} seconds. What is your guess?"
  end

  def self.evaluated_guess(correct_positions, wrong_colors)
      "You have #{correct_positions} in the right position and #{wrong_colors} in the wrong position.\n"
  end

  def self.win(layout, turns, time_elapsed)
    "YOU HAVE WON THE GAME.\n Your winning guess was #{layout.join}, you took #{turns} turns, and you did it in #{time_elapsed} seconds. "

  end

  def self.end_game
    "GOODBYE"
  end

  def self.play_again?
    "Do you want to (p)lay again or (q)uit?"
  end



end
