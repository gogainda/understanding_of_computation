Dir[File.join(File.dirname(__FILE__), '..', '..', 'denotational_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestBoolean < Minitest::Test
  def test_boolean
    proc = eval(Boolean.new(false).to_ruby)

    assert_equal false, proc.call({})
  end
end