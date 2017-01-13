class Cross
  #class << self
    #attr_accessor :population               # Hash with all configuration parameters
    #attr_accessor :n               # Hash with all configuration parameters
  #end  

  def self.cross(population, params)  
    cross_points    = params[:cross_points].to_i
    gene_length     = params[:gene_length].to_i 
    cross_selected  = params[:cross_selected].to_i    
    crossed         = []

    point = rand(1..gene_length-1)
    puts 'Cross point: ' + point.to_s
    population.each {|n| puts n[0].to_s}
    for i in 0..population.length-2
      crossed << population[i+1][0].to_s[0..point] + population[i][0].to_s[point+1..gene_length-1]
      crossed << population[i][0].to_s[0..point] + population[i+1][0].to_s[point+1..gene_length-1]
    end
    for i in cross_selected..population.length-1
      population[i][0].individual   = s_to_a(crossed[i-cross_selected])
    end
    puts
    population.each {|n| puts n[0].to_s}
    population
  end

  def self.s_to_a(gene)
    gene.split("").map { |s| s.to_i }
  end
end
