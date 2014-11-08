class Board
  attr_reader :layout

  def initalize()
  end

  def generate
    @layout = []
    possibilities = ["r", "g", "b", "y"]
    4.times { @layout << possibilities.sample }
    @layout
  end


end
