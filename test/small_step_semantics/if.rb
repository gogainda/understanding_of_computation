Dir[File.join(File.dirname(__FILE__), '..', 'small_step_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestIf < Minitest::Test
  def setup
    @if = If.new(
      Variable.new(:x),
      Number.new(1),
      Number.new(2)
    )
  end

  def test_consequence
    reduced_if_statement, env = @if.reduce({ x: Boolean.new(true) })

    assert_equal [Number.new(1), env], reduced_if_statement.reduce(env)
  end

  def test_alternative
    reduced_if_statement, env = @if.reduce({ x: Boolean.new(false) })

    assert_equal [Number.new(2), env], reduced_if_statement.reduce(env)
  end
end