require_relative 'test_helper'

class HighscoreTest < Minitest::Test

    def test_initialize_creates_header
      high = Highscore.new($stdin, $stdout, "filename.csv")
      assert_equal "#{"Rank".center(20)}#{"Name".center(20)} #{"Answer".center(20)} #{"Score".center(20)} #{"Time".center(20)}", high.header_for_display
    end

    def test_load_scores
      high = Highscore.new($stdin, $stdout, "filename.csv")
      high.load_old_scores
      assert_equal ["iouihjk","BYGY","1","2"], high.scores[0]
    end

    def test_add_score
      high = Highscore.new($stdin, $stdout, "filename.csv")
      high.add_new_score(1,2,3,4)
      assert_equal [[1,2,3,4]], high.scores
    end
    
end
