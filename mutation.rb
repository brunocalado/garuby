class Mutation
  class << self
    attr_accessor :population               # Hash with all configuration parameters
    attr_accessor :n               # Hash with all configuration parameters
  end  

  def self.mutation(population, params)  
    mutation_rate   = params[:mutation_rate].to_f
    gene_length     = params[:gene_length].to_i 

    puts 'Mutation: ' + mutation_rate.to_s
    for i in population
      mutate = rand<=mutation_rate      
      if true
        puts mutate
        puts i        
      end

    end

    population
  end

  def self.s_to_a(gene)
    gene.split("").map { |s| s.to_i }
  end
end
