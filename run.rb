# Required libraries
require_relative 'common.rb'
require_relative 'binary.rb'
require_relative 'cross.rb'
require_relative 'mutation.rb'
require_relative 'configs.rb'

# Load settings
block
puts "Configurations"
puts Configs.load_from_file('ga.ini')
population_size   = Configs.params[:population_size].to_i
gene_length       = Configs.params[:gene_length].to_i
generation_limit  = Configs.params[:generation_limit].to_i
cross_points      = Configs.params[:cross_points].to_i # max 1
cross_selected    = Configs.params[:cross_selected].to_i
mutation_rate     = Configs.params[:mutation_rate].to_f
debug             = Configs.params[:debug] == 'true'
population = []

block
puts "Save fitness"
# load genotype
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

block('=', "Initial population")
# Create inicial population
for i in 0..population_size-1
  individual = Genotype.new(gene_length)
  population << [individual, individual.fitness]
  puts population[i][0].to_s + ": " + population[i][1].to_s # Shows inicial population
end
# fitness
block('-', "Population score")
population.each {|n| n[1] = n[0].fitness }


# Run generations
for i in 1..generation_limit
  block('=', "Generation: [#{i}]") if debug
  population.each {|n| puts n[0].to_s + ": " + n[1].to_s}
  
  # selection
  block('-', "Population sorted") if debug
  population.sort_by!{|x,y| y}.reverse!
  population.each {|n| puts n[0].to_s + ": " + n[1].to_s} if debug
    
  # cross
  block('-', "Cross") if debug
  population = Cross.cross(population, Configs.params)

  # mutation
  block('-', "Mutation") if debug
  population = Mutation.mutation(population, Configs.params)

  # fitness
  block('-', "Population score") if debug
  population.each {|n| n[1] = n[0].fitness }
end

# Saves solutions
population.sort_by!{|x,y| y}.reverse!
save_pop(population)


