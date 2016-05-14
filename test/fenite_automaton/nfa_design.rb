Dir[File.join(File.dirname(__FILE__),'..' , '..', 'the_simplest_computers','**' , '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestNfaDesign < Minitest::Test

  def setup
    @rulebook = NFARulebook.new([
                                    FARule.new(1, 'a', 1), FARule.new(1, 'b', 1),  FARule.new(1, 'b', 2),
                                    FARule.new(2, 'a', 3), FARule.new(2, 'b', 3),
                                    FARule.new(3, 'a', 4), FARule.new(3, 'b', 4)
                                ])
  end

  def test_read_string_using_dfa_desing
    nfa_design =  NFADesign.new(1, [4], @rulebook)

    assert_equal true, nfa_design.accepts?('bab')
    assert_equal true, nfa_design.accepts?('bbbbb')
    assert_equal false, nfa_design.accepts?('bbabb')
  end
end