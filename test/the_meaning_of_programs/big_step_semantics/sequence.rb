Dir[File.join(File.dirname(__FILE__), '..', '..', 'big_step_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestSequence < Minitest::Test
  def test_sequence
    sequence = Sequence.new(
        Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
        Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
    )
    expected = { x: Number.new(2), y: Number.new(5) }

    assert_equal expected, sequence.evaluate({})
  end
end