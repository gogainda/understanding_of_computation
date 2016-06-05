Dir[File.join(File.dirname(__FILE__),'..' , '..', 'the_simplest_computers','**' , '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestNFASimulation < Minitest::Test
  def test_it
    rulebook = NFARulebook.new([
                                   FARule.new(1, 'a', 1), FARule.new(1, 'a', 2), FARule.new(1, nil, 2),
                                   FARule.new(2, 'b', 3),
                                   FARule.new(3, 'b', 1), FARule.new(3, nil, 2)
                               ])

    nfa_design =  NFADesign.new(1, [3], rulebook)
    simulation = NFASimulation.new(nfa_design)

    assert_equal Set[2, 1], simulation.next_state(Set[1,2], 'a')
    assert_equal Set[3, 2], simulation.next_state(Set[1,2], 'b')
    assert_equal Set[1, 3, 2], simulation.next_state(Set[3,2], 'b')
    assert_equal Set[1, 3, 2], simulation.next_state(Set[1, 3, 2], 'b')
    assert_equal Set[1, 2], simulation.next_state(Set[1, 3, 2], 'a')
  end
end