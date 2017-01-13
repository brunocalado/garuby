# Required libraries
require_relative 'common.rb'
require_relative 'binary.rb'

class Genotype < Binary; end
Genotype.class_eval do
  # =======================================================
  # Define fitness
  # Use @individual for an array with the gene
  def fitness
    out = 0
    @individual.each {|n| out+=n}
    out
  end
  # Extra functions
  # =======================================================
end
