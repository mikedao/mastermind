class Timer
  attr_reader :time_elapsed

  def initialize

  end

  def begin_timer
    @start = Time.now
  end

  def end_timer
    @end = Time.now
  end

  def time_elapsed
    @end - @start
  end

end


timer = Timer.new
timer.begin_timer
sleep(5)
timer.end_timer

puts timer.time_elapsed
