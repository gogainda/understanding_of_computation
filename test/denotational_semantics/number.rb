Dir[File.join(File.dirname(__FILE__), '..', '..', 'denotational_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestNumber < Minitest::Test
  def test_number
    proc = eval(Number.new(5).to_ruby)

    assert_equal 5, proc.call({})
  end
end