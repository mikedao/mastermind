class Board
  attr_reader :layout

  def initialize
    @layout = []
    4.times { @layout << ["r", "g", "b", "y"].sample }
    puts Display.first_turn
    @layout.join
  end

end
