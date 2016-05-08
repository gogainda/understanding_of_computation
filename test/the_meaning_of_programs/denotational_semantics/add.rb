Dir[File.join(File.dirname(__FILE__), '..', '..', 'denotational_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestAdd < Minitest::Test
  def test_add
    environment = { x: 3 }
    proc = eval(Add.new(Variable.new(:x), Number.new(1)).to_ruby)

    assert_equal 4, proc.call(environment)
  end
end