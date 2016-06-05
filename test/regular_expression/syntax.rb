Dir[File.join(File.dirname(__FILE__),'..' , '..', 'the_simplest_computers','**' , '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestSyntax < Minitest::Test

  # def test_syntaxt
  #   pattern =
  #     Repeat.new(
  #       Choose.new(
  #         Concatenate.new(Literal.new('a'), Literal.new('b')),
  #         Literal.new('a')
  #       )
  #     )
  #
  #   assert_equal '/(ab|a)*/', pattern.inspect
  # end
  #
  # def test_empty
  #   nfa_design = Empty.new.to_nfa_design
  #
  #   assert_equal true, nfa_design.accepts?('')
  #   assert_equal false, nfa_design.accepts?('a')
  # end

  def test_literal
    nfa_design = Literal.new('a').to_nfa_design

    assert_equal false, nfa_design.accepts?('')
    assert_equal true, nfa_design.accepts?('a')
    assert_equal false, nfa_design.accepts?('b')
  end

  def test_matches_method
    literal = Literal.new('a')

    assert_equal false, literal.matches?('')
    assert_equal true, literal.matches?('a')
    assert_equal false, literal.matches?('b')
  end

  def test_concatenate
    pattern = Concatenate.new(Literal.new('a'), Literal.new('b'))

    assert_equal '/ab/', pattern.inspect
    assert_equal false, pattern.matches?('a')
    assert_equal true, pattern.matches?('ab')
    assert_equal false, pattern.matches?('abc')
  end

  def test_regualr_expressiong
    pattern = Concatenate.new(
      Literal.new('a'),
      Concatenate.new(Literal.new('b'), Literal.new('c'))
    )

    assert_equal '/abc/', pattern.inspect
    assert_equal false, pattern.matches?('a')
    assert_equal false, pattern.matches?('ab')
    assert_equal true, pattern.matches?('abc')
  end

  def test_choose
    pattern = Choose.new(Literal.new('a'), Literal.new('b'))

    assert_equal '/a|b/', pattern.inspect
    assert_equal true, pattern.matches?('a')
    assert_equal true, pattern.matches?('b')
    assert_equal false, pattern.matches?('c')
  end

  def test_regualr_expressiong_repeat
    pattern = Repeat.new(
        Literal.new('a')
    )

    assert_equal '/a*/', pattern.inspect
    assert_equal true, pattern.matches?('')
    assert_equal true, pattern.matches?('a')
    assert_equal true, pattern.matches?('aa')
    assert_equal true, pattern.matches?('aaaa')
    assert_equal false, pattern.matches?('b')
  end
end