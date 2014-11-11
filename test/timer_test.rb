require_relative 'test_helper'
require 'timer'

class TimerTest < Minitest::Test

  def test_has_end_timer
    timer = Timer.new
    assert timer.respond_to?(:end_timer)
  end

  def test_has_a_start_time
    timer = Timer.new
    assert timer.start
  end

  def test_has_a_end_time
    timer = Timer.new
    timer.end_timer
    assert timer.end
  end

  def test_timer_actually_works
    timer = Timer.new
    sleep(5)
    timer.end_timer
    assert_equal 5 , timer.time_elapsed
  end

  def test_current_elapsed_time_works
    timer = Timer.new
    sleep(5)
    assert_equal 5, timer.current_elapsed_time
  end

end
