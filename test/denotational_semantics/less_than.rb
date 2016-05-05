Dir[File.join(File.dirname(__FILE__), '..', '..', 'denotational_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestLessThan < Minitest::Test
  def test_less_than
    environment = { x: 3 }
    proc = eval(LessThan.new(Variable.new(:x), Number.new(1)).to_ruby)

    assert_equal false, proc.call(environment)
  end
end