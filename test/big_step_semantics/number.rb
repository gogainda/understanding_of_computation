Dir[File.join(File.dirname(__FILE__), '..', '..', 'big_step_semantics', '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestNumber < Minitest::Test
  def test_number
    number = Number.new(23).evaluate({})

    assert_match number.to_s, "23"
  end
end