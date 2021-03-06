# Required libraries
require_relative 'common.rb'
require_relative 'cross.rb'
require_relative 'mutation.rb'
require_relative 'configs.rb'
require_relative 'fitness.rb'

# Load settings
block
puts "Configurations"
puts Configs.load_from_file('ga.ini')
population_size   = Configs.params[:population_size].to_i
gene_length       = Configs.params[:gene_length].to_i
generations_limit  = Configs.params[:generations_limit].to_i
cross_points      = Configs.params[:cross_points].to_i # max 1
cross_selected    = Configs.params[:cross_selected].to_i
mutation_rate     = Configs.params[:mutation_rate].to_f
debug             = Configs.params[:debug] == 'true'
population = []

block('=', "Initial population")
# Create inicial population
for i in 0..population_size-1
  individual = Genotype.new(gene_length)
  population << [individual, individual.fitness]
  puts population[i][0].to_s + ": " + population[i][1].to_s # Shows inicial population
end

# Run generations
for i in 1..generations_limit
  block('=', "Generation: #{i}/#{generations_limit}")
  population.each {|n| puts n[0].to_s + ": " + n[1].to_s} if debug

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
population.each {|n| puts n[0].to_s + ": " + n[1].to_s} if debug
