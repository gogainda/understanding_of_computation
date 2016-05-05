Dir[File.join(File.dirname(__FILE__), '..', '..', 'denotational_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestWhile < Minitest::Test
  def test_while
    statement =
      While.new(
          LessThan.new(Variable.new(:x), Number.new(5)),
          Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
      )
    proc = eval(statement.to_ruby)
    expected = { x: 9 }

    assert_equal expected, proc.call({ x: 1})
  end
end