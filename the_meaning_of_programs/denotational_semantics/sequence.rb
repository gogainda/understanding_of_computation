class Sequence < Struct.new(:first, :second)
  def to_ruby
    "-> e { (#{second.to_ruby}).call((#{first.to_ruby}).call(e)) }"
  end

  def reducible?
    true
  end

  def inspect
    "<#{self}>"
  end
end
