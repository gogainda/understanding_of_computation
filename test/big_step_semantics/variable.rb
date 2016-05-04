Dir[File.join(File.dirname(__FILE__), '..', '..', 'big_step_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestVariable < Minitest::Test
  def test_variable
    variable = Variable.new(:x).evaluate({ x: Number.new(23) })

    assert_match variable.to_s, "23"
  end
end