require_relative 'test_helper'

class CLITest < Minitest::Test


  def test_play
    cli= CLI.new($stdin,$stdout)
    cli.stub :command, 'p' do
      assert cli.play?
      refute cli.instructions?
      refute cli.finished?
    end
  end

  def test_instructions
    cli= CLI.new($stdin,$stdout)
    cli.stub :command, 'i' do
      refute cli.play?
      assert cli.instructions?
      refute cli.finished?
    end
  end

  def test_quit
    cli= CLI.new($stdin,$stdout)
    cli.stub :command, 'q' do
      refute cli.play?
      refute cli.instructions?
      assert cli.finished?
    end

    cli.stub :command, 'quit' do
      refute cli.play?
      refute cli.instructions?
      assert cli.finished?
    end
  end

end
