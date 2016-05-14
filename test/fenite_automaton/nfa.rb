Dir[File.join(File.dirname(__FILE__),'..' , '..', 'the_simplest_computers','**' , '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestDfa < Minitest::Test

  def setup
    @rulebook = NFARulebook.new([
                                    FARule.new(1, 'a', 1), FARule.new(1, 'b', 1),  FARule.new(1, 'b', 2),
                                    FARule.new(2, 'a', 3), FARule.new(2, 'b', 3),
                                    FARule.new(3, 'a', 4), FARule.new(3, 'b', 4)
                                ])
  end

  def test_dfa_accepting
    isAccepting = NFA.new(Set[1], [4], @rulebook).accepting?

    assert_equal false, isAccepting
  end

  def test_dfa_accepting_falsy
    isAccepting = NFA.new(Set[1, 2, 4], [4], @rulebook).accepting?

    assert_equal true, isAccepting
  end

  # def test_read_character
  #   dfa = DFA.new(1, [3], @rulebook)
  #
  #   assert_equal false, dfa.accepting?
  #
  #   dfa.read_character('b')
  #
  #   assert_equal false, dfa.accepting?
  #
  #   3.times { dfa.read_character('a') }
  #   dfa.read_character('b')
  #
  #   assert_equal true, dfa.accepting?
  # end
  #
  # def test_read_string
  #   dfa = DFA.new(1, [3], @rulebook)
  #   dfa.read_string('baaab')
  #
  #   assert_equal true, dfa.accepting?
  # end
  #
  # def test_read_string_using_dfa_desing
  #   dfa_design =  DFADesign.new(1, [3], @rulebook)
  #
  #   assert_equal false, dfa_design.accepts?('a')
  #   assert_equal false, dfa_design.accepts?('baa')
  #   assert_equal true, dfa_design.accepts?('baba')
  # end

end