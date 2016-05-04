class If < Struct.new(:condition, :consequence, :alternative)
  def to_s
    "if (#{condition} { #{consequence} } else { #{alternative} }"
  end

  def reducible?
    true
  end

  def inspect
    "<#{self}>"
  end

  def evaluate(environment)
    case condition.evaluate(environment)
      when Boolean.new(true)
        consequence.evaluate(environment)
      when Boolena.new(false)
        alternative.evaluate(environment)
    end
  end
end
