Dir[File.join(File.dirname(__FILE__), '..', '..', 'big_step_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestWhile < Minitest::Test
  def test_while
    statement =
      While.new(
          LessThan.new(Variable.new(:x), Number.new(5)),
          Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
      )
    expected = { x: Number.new(9) }

    assert_equal expected, statement.evaluate({ x: Number.new(1) })
  end
end