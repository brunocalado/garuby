class Mutation
  #class << self
    #attr_accessor :population               # Hash with all configuration parameters
  #end  

  def self.mutation(population, params)  
    mutation_rate   = params[:mutation_rate].to_f
    gene_length     = params[:gene_length].to_i 
    cross_selected  = params[:cross_selected].to_i    
    
    puts 'Mutation rate: ' + mutation_rate.to_s
    for i in cross_selected..population.length-1
      if rand<=mutation_rate
        mutate_position = rand(0..gene_length-1)
        puts "Antes (#{mutate_position}): \n" + population[i][0].to_s
        population[i][0].individual[mutate_position] = population[i][0].individual[mutate_position] == 0 ? 1 : 0
        puts "Depois (#{mutate_position}): \n" + population[i][0].to_s        
      end
    end

    population
  end

  def self.s_to_a(gene)
    gene.split("").map { |s| s.to_i }
  end
end
