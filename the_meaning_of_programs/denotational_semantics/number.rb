class Number < Struct.new(:value)
  def to_ruby
    " -> e { #{value.inspect} }"
  end

  def to_s
    value.to_s
  end

  def inspect
    "#{value}"
  end
end
