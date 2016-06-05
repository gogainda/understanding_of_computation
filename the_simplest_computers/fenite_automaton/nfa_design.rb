class NFADesign < Struct.new(:start_state, :accept_states, :rulebook)
  def to_dfa
    NFA.new(Set[start_state], accept_states, rulebook)
  end

  def accepts?(string)
    to_dfa.tap{ |dfa| dfa.read_string(string) }.accepting?
  end

  def to_nfa(current_states = Set[start_state])
    NFA.new(current_states, accept_states, rulebook)
  end
end