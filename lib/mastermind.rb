require_relative 'game'
require_relative 'display'
require_relative 'take_turn'

puts Display.intro
game = Game.new
loop do
  puts Display.initial_instructions
  answer = gets.chomp.downcase
  case answer
  when 'p'
    game.game_start
    # puts Display.initial_instructions
    game.play
  when 'i'
    puts Display.print_instructions
  when 'q'
    puts Display.end_game
    abort
  else
    puts "Please enter a number or 'quit'"
  end
end
