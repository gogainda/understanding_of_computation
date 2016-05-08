class LessThan < Struct.new(:left, :right)
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value < right.evaluate(environment).value)
  end

  def to_s
    "#{left} < #{right}"
  end

  def inspect
    "<#{self}>"
  end

  def reducible?
    true
  end
end
