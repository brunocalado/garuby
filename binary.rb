# Binary gene. Array of 0s or 1s.
class Binary
  attr_accessor :individual

  # Create a random binary array
  def initialize(size)
    @size = size
    @individual = []
    size.times {@individual<<rand(2)}
  end

  # Returns the @individual as String
  def to_s
    out = ''
    @individual.each {|n| out+=n.to_s}
    out
  end    
end # Binary Class end

