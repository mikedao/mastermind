require 'csv'

class Highscore
  attr_reader   :scores,
                :filename,
                :top_ten,
                :instream,
                :outstream,
                :header_for_display

  def initialize(instream, outstream, filename)
    @instream             = instream
    @outstream            = outstream
    @scores               = []
    @filename             = filename
    @top_ten              = []
    @header_for_display   = "#{"Rank".center(20)}#{"Name".center(20)} #{"Answer".center(20)} #{"Score".center(20)} #{"Time".center(20)}"
  end

  def do_high_scores(name, answer, score, time)
    load_old_scores
    add_new_score(name, answer, score, time)
    sort_score
    get_top_ten
    print_top_ten
    write_top_ten
    outstream.puts show_averages
  end

  def load_old_scores
    CSV.foreach(filename, headers: true) do |row|
      @scores << [row["Name"], row["Answer"], row["Score"], row["Time"]]
    end
  end

  def add_new_score(name, answer, turns, time)
    to_add = [name, answer, turns, time]
    @scores << to_add
  end

  def sort_score
    @scores = @scores.sort_by { |score| score[3].to_i }
  end

  def get_top_ten
    @top_ten = @scores.first(10)
  end

  def print_top_ten
    outstream.puts "#{'HIGH SCORES'.center(100,'=')}"
    outstream.puts header_for_display
    @top_ten.each_with_index { |score, i| outstream.puts "#{(i+1).to_s.center(20)} #{score[0].to_s.center(20)} #{score[1].to_s.center(20)}  #{score[2].to_s.center(20)} #{score[3].to_s.center(20)}"  }
  end

  def write_top_ten
    File.open(@filename, "w") do |file|
      file.puts "Name,Answer,Score,Time"
    end

    File.open(@filename, "a") do |file|
      @top_ten.map do |score|
        file.puts "#{score[0]},#{score[1]},#{score[2]},#{score[3]}"
      end
    end
  end

  def calculate_average_score
    all_scores  = []
    @top_ten.each { |array| all_scores << array[2].to_i }
    average(all_scores)
  end

  def average(number)
    number/10
  end



  def calculate_average_time
    all_times   = []
    @top_ten.each { |array| all_times << array[3].to_i }
    average(all_times)
  end

  def show_averages
    "\nAverage score of the top ten was #{calculate_average_score} and average time was #{calculate_average_time}."
  end
end
