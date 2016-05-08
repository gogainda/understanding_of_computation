Dir[File.join(File.dirname(__FILE__), '..', '..', 'denotational_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestVariable < Minitest::Test
  def test_variable
    proc = eval(Variable.new(:x).to_ruby)

    assert_equal 7, proc.call({ x: 7 })
  end
end