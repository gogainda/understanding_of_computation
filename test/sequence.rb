Dir[File.join(File.dirname(__FILE__), '..', 'simple_ast', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestSequence < Minitest::Test
  def setup
    @machine_state = Machine.new(
        Sequence.new(
            Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
            Assign.new(:y, Add.new(Variable.new(:x), Number.new(1)))
        ),
        {}
    )
  end

  def test_machine
    @machine_state.run
    assert_equal nil, @machine_state.run
  end
end