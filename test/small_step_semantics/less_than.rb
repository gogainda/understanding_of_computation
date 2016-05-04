Dir[File.join(File.dirname(__FILE__), '..', 'simple_ast', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestLessThan < Minitest::Test

  def test_without_variables
    @machine_state = Machine.new(
        LessThan.new(Number.new(5), Add.new(Number.new(2), Number.new(2))),
        {}
    )
    @machine_state.run
    assert_equal nil, @machine_state.run
  end

  def test_with_reducible_left
    @machine_state = Machine.new(
        LessThan.new(Variable.new(:x), Add.new(Number.new(2), Number.new(2))),
        { x: Number.new(4) }
    )
    @machine_state.run
    assert_equal nil, @machine_state.run
  end
end