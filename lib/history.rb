class History
  attr_reader   :instream,
                :outstream,
                :history,
                :top

  def initialize(instream, outstream, history)
    @instream   = instream
    @outstream  = outstream
    @history    = history
  end

  def top
    border = []
    34.times { border << '-'}
    border.join
  end

  def display(history)
    display_header
    history.each_with_index do |guess, index|
      outstream.puts "| #{(index+1).to_s.center(14)}| #{guess.upcase.center(14)} |"
    end
    outstream.puts top
  end

  def display_header
    outstream.puts top
    outstream.puts "| #{"history".center(30)} |"
    outstream.puts top
  end

end
