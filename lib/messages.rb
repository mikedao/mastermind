require 'colorize'

module Messages

  def self.intro
'WELCOME TO...
   _____      _____    _______________________________________      _____  .___ _______  ________
  /     \    /  _  \  /   _____/\__    ___/\_   _____/\______ \    /     \ |   |\      \ \______ \
 /  \ /  \  /  /_\  \ \_____  \   |    |    |    __)_  |    |  \  /  \ /  \|   |/   |   \ |    |  \
/    Y    \/    |    \/        \  |    |    |        \ |    `   \/    Y    \   /    |    \|    `   \
\____|__  /\____|__  /_______  /  |____|   /_______  //_______  /\____|__  /___\____|__  /_______  /
        \/         \/        \/                    \/         \/         \/            \/        \/
' + program_instructions
  end

  def self.program_instructions
    "\nEnter 'p' to play, 'i' for instructions, or 'q' to quit."
  end

  def self.command_request
    "\nEnter your command: \n> "
  end

  def self.game_command_request(turns, time)
    "\nEnter your command: \n[ Turns: #{turns} Time: #{time} ] > "
  end

  def self.game_instructions
    clear_screen
    "\nI have selected a secret combination of colors(Red (r), Green (g), Blue (b) and Yellow (y)). Guess the combination to win. I will tell you how many of your colors are in the right position. I will also tell you how many colors are in the wrong position.\n" + program_instructions
  end

  def self.game_intro
    "Game initialized."
  end

  def self.turn_indicator(turns, elapsed_time)
    "This is turn #{turns}. #{elapsed_time} seconds have elapsed."
  end

  def self.game_quit
    "\nExiting the game."
  end

  def self.game_win(layout, turns, time_elapsed)
    clear_screen
    minutes = time_elapsed / 60
    seconds = time_elapsed % 60
    puts "\nCongratulations!.\nYour winning guess was #{layout}, you took #{turns} turns, and you did it in #{minutes} #{minutes == 1 ? "minute" : "minutes"} and #{seconds} seconds. "
  end

  def self.not_a_valid_guess
    "\nYour guess is not valid. Try again."
  end

  def self.guess_status(correct_position, correct_colors)
    "\nYou have #{correct_position} items in the correct position. You have #{correct_colors} in the incorrect position."
  end

  def self.clear_screen
    print "\e[2J\e[f"
  end

end
