class Timer
  attr_reader :time_elapsed, :start, :end

  def initialize

  end

  def begin_timer
    @start = Time.now
  end

  def end_timer
    @end = Time.now
  end

  def time_elapsed
    (@end - @start).round
  end

end
