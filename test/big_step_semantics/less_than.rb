Dir[File.join(File.dirname(__FILE__), '..', '..', 'big_step_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestLessThan < Minitest::Test
  def test_less_than
    variable = LessThan.new(
        Add.new(Variable.new(:x), Number.new(2)),
        Variable.new(:y)
    ).evaluate({x: Number.new(2), y: Number.new(5)})

    assert_match variable.to_s, "true"
  end
end