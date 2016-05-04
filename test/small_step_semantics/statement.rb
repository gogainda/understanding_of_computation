Dir[File.join(File.dirname(__FILE__), '..', 'simple_ast', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestStatement < Minitest::Test
  def setup
    @statement = Assigln.new(:x, Add.new(Variable.new(:x), Number.new(1)))
    @environment = { x: Number.new(2) }
  end

  def test_that_statement_is_reducible
    assert_equal true, @statement.reducible?
  end

  def test_reduce_workflow
    statement, environment = @statement.reduce(@environment)

    assert_equal ["<x = 2 + 1>", { x: "2" }], [statement, environment]
  end
end