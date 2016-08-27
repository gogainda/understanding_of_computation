Dir[File.join(File.dirname(__FILE__),'..' , '..', 'the_simplest_computers','**' , '*.rb')].each {|file| require file }
require "minitest/autorun"

class TestSyntax < Minitest::Test
  def test_stack
    stack = Stack.new(['a', 'b', 'c', 'd', 'e'])

    assert_equal "#<Stack (a)bcde>", stack.inspect
    assert_equal "a", stack.top
    assert_equal "c", stack.pop.pop.top
    assert_equal "y", stack.push('x').push('y').top
    assert_equal "x", stack.push('x').push('y').pop.top
  end

  def test_rule
    rule = PDARule.new(1, '(', 2, '$', ['b', '$'])
    configuration = PDAConfiguration.new(1, Stack.new(['$']))

    assert_equal true, rule.applies_to?(configuration, '(')
  end

  def test_follow_rule
    rule = PDARule.new(1, '(', 2, '$', ['b', '$'])
    configuration = PDAConfiguration.new(1, Stack.new(['$']))

    assert_equal PDAConfiguration.new(2, Stack.new(['b', '$'])), rule.follow(configuration)
  end

  def test_nex_configuration
    rulebook = DPDARulebook.new([
      PDARule.new(1, '(', 2, '$', ['b', '$']),
      PDARule.new(2, '(', 2, 'b', ['b', 'b']),
      PDARule.new(2, ')', 2, 'b', []),
      PDARule.new(2, nil, 1, '$', ['$'])
    ])

    configuration = PDAConfiguration.new(1, Stack.new(['$']))

    assert_equal PDAConfiguration.new(2, Stack.new(['b', '$'])), rulebook.next_configuration(configuration, '(')
  end

  def test_dpda
    configuration = PDAConfiguration.new(1, Stack.new(['$']))
    rulebook = DPDARulebook.new([
                                    PDARule.new(1, '(', 2, '$', ['b', '$']),
                                    PDARule.new(2, '(', 2, 'b', ['b', 'b']),
                                    PDARule.new(2, ')', 2, 'b', []),
                                    PDARule.new(2, nil, 1, '$', ['$'])
                                ])
    dpda = DPDA.new(configuration, [1], rulebook)

    configuration = PDAConfiguration.new(2, Stack.new(['b', '$']))

    assert_equal true, dpda.accepting?
    dpda.read_string('(()')
    assert_equal false, dpda.accepting?
    assert_equal configuration, dpda.current_configuration
  end

  def test_free_moves
    configuration = PDAConfiguration.new(1, Stack.new(['$']))
    rulebook = DPDARulebook.new([
                                    PDARule.new(1, '(', 2, '$', ['b', '$']),
                                    PDARule.new(2, '(', 2, 'b', ['b', 'b']),
                                    PDARule.new(2, ')', 2, 'b', []),
                                    PDARule.new(2, nil, 1, '$', ['$'])
                                ])
    dpda = DPDA.new(configuration, [1], rulebook)

    dpda.read_string('(()(')
    assert_equal false, dpda.accepting?
    assert_equal PDAConfiguration.new(2, Stack.new(['b','b', '$'])), dpda.current_configuration
    dpda.read_string('))()')
    assert_equal true, dpda.accepting?
    assert_equal PDAConfiguration.new(1, Stack.new(['$'])), dpda.current_configuration
  end

  def test_dpda_design
    rulebook = DPDARulebook.new([
                                    PDARule.new(1, '(', 2, '$', ['b', '$']),
                                    PDARule.new(2, '(', 2, 'b', ['b', 'b']),
                                    PDARule.new(2, ')', 2, 'b', []),
                                    PDARule.new(2, nil, 1, '$', ['$'])
                                ])
    dpda_design = DPDADesign.new(1, '$', [1], rulebook)

    assert_equal true, dpda_design.accepts?('(((())))')
    assert_equal false, dpda_design.accepts?('((((())))')
  end
end