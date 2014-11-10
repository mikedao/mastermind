class Board
  attr_reader :layout

  def initialize
    @layout = []
    4.times { @layout << ["r", "g", "b", "y"].sample }
    puts "Randomly generating board..."
    @layout.join
  end

end
