Dir[File.join(File.dirname(__FILE__), '..', 'small_step_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestWhile < Minitest::Test
  def setup
    @machine_state = Machine.new(
        While.new(
            LessThan.new(Variable.new(:x), Number.new(5)),
            Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
        ),
        { x: Number.new(1) }
    )
  end

  def test_while
    @machine_state.run
    assert_equal nil, @machine_state.run
  end
end