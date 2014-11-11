require 'csv'

class Highscore
  attr_reader   :scores,
                :filename,
                :top_ten,
                :instream,
                :outstream

  def initialize(instream, outstream, filename)
    @instream   = instream
    @outstream  = outstream
    @scores     = []
    @filename   = filename
    @top_ten    = []
  end

  def do_high_scores(name, answer, score, time)
    load_old_scores
    add_new_score(name, answer, score, time)
    sort_score
    get_top_ten
    print_top_ten
    add_headers
    write_top_ten
  end

  def load_old_scores
    CSV.foreach(@filename, headers: true) do |row|
      @scores << [row["Name"], row["Answer"], row["Score"], row["Time"]]
    end
  end

  def sort_score
    @scores = @scores.sort_by { |score| score[2].to_i }
  end

  def add_headers
    File.open(@filename, "w") do |file|
      file.puts "Name,Answer,Score,Time"
    end
  end

  def write_top_ten
    File.open(@filename, "a") do |file|
      @top_ten.map do |score|
        file.puts "#{score[1]},#{score[2]},#{score[3]},#{score[4]}"
      end
    end
  end


  def get_top_ten
    10.times do |x|
      @top_ten << @scores[x] if @scores[x] != nil
      @top_ten[x].unshift(x+1) if @top_ten[x] != nil
    end
  end

  def print_top_ten
    outstream.puts "#{"rank".ljust(10)}#{"Name".ljust(10)} #{"Answer".ljust(10)} #{"Score".ljust(10)} #{"Time".ljust(10)}"
  @top_ten.map { |score| outstream.puts "#{score[0].to_s.ljust(9)} #{score[1].to_s.ljust(10)} #{score[2].to_s.ljust(9)}  #{score[3].to_s.ljust(10)} #{score[4].to_s.ljust(10)}"  }
  end

  def add_new_score(name, answer, turns, time)
    to_add = [name, answer, turns, time]
    @scores << to_add
  end

end
