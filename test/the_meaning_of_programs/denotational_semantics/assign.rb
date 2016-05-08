Dir[File.join(File.dirname(__FILE__), '..', '..', 'denotational_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestAdd < Minitest::Test
  def test_assing
    environment = { x: 3 }
    expected = {y: 4, x: 3}
    p Assign.new(:y, Add.new(Variable.new(:x), Number.new(1))).to_ruby
    proc = eval(Assign.new(:y, Add.new(Variable.new(:x), Number.new(1))).to_ruby)

    assert_equal expected, proc.call(environment)
  end
end