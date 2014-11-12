class Board
  COLORS = ["r", "g", "b", "y"]
  attr_reader :layout

  def initialize
    @layout = []
    4.times { @layout << COLORS.sample }
  end

end
