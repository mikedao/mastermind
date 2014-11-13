class Board
  COLORS = ["r", "g", "b", "y"]
  attr_reader :layout

  def initialize
[]
    @layout = COLORS.map { COLORS.sample }
  end

end
