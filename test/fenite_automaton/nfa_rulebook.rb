Dir[File.join(File.dirname(__FILE__),'..' , '..', 'the_simplest_computers','**' , '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestNFARulebook < Minitest::Test
  def test_rule_book
    rulebook = NFARulebook.new([
        FARule.new(1, 'a', 1), FARule.new(1, 'b', 1),  FARule.new(1, 'b', 2),
        FARule.new(2, 'a', 3), FARule.new(2, 'b', 3),
        FARule.new(3, 'a', 4), FARule.new(3, 'b', 4)
    ])

    assert_equal Set[1, 2], rulebook.next_states(Set[1], 'b')
    assert_equal Set[1, 3], rulebook.next_states(Set[1, 2], 'a')
    assert_equal Set[1, 2, 4], rulebook.next_states(Set[1, 3], 'b')
  end
end