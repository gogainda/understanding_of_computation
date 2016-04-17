Dir[File.join(File.dirname(__FILE__), '..', 'simple_ast', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestMachine < Minitest::Test
  def setup
    @machine_state = Machine.new(
      Assign.new(:x, Add.new(Variable.new(:x), Number.new(1))),
      { x: Number.new(2) }
    )
  end

  def test_machine
    @machine_state.run
    assert_equal nil, @machine_state.run
  end
end