Dir[File.join(File.dirname(__FILE__),'..' , '..', 'the_simplest_computers','**' , '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestFreeMove < Minitest::Test

  def setup
    @rulebook = NFARulebook.new([
                                    FARule.new(1, nil, 2), FARule.new(1, nil, 4),
                                    FARule.new(2, 'a', 3),
                                    FARule.new(3, 'a', 2),
                                    FARule.new(4, 'a', 5),
                                    FARule.new(5, 'a', 6),
                                    FARule.new(6, 'a', 4)
                                ])
  end

  def test_rulebook_with_free_moves
    assert_equal Set[2, 4], @rulebook.next_states(Set[1], nil)
  end

  def test_get_all_reachable_states_with_free_moves
    assert_equal Set[1, 2, 4], @rulebook.follow_free_moves(Set[1])
  end

  def test_nfa_with_free_moves
    nfa_design = NFADesign.new(1, [2, 4], @rulebook)
    assert_equal true, nfa_design.accepts?('aa')
    assert_equal true, nfa_design.accepts?('aaa')
    assert_equal false, nfa_design.accepts?('aaaaa')
    assert_equal true, nfa_design.accepts?('aaaaaa')
  end
end