class Variable < Struct.new(:name)
  def to_ruby
    "-> e { e[#{name.inspect}] }"
  end

  def to_s
    name.to_s
  end

  def inspect
    "<#{self}>"
  end

  def reducible?
    true
  end
end
