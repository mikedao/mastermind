require_relative 'game'
require_relative 'display'

puts Display.intro
game = Game.new
loop do
  puts Display.initial_instructions
  answer = gets.chomp.downcase
  case answer
  when 'p'
    game.game_start
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
