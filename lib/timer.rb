class Timer
  attr_reader :start, :end

  def begin_timer
    @start = Time.now
  end

  def end_timer
    @end = Time.now
  end

  def current_elapsed_time
    (Time.now - @start).round
  end

  def time_elapsed
    (@end - @start).round
  end

end
