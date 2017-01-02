class Cross
  class << self
    attr_accessor :population               # Hash with all configuration parameters
    attr_accessor :n               # Hash with all configuration parameters
  end  

  def self.cross(population, params)  
    cross_points    = params[:cross_points].to_i
    cross_selected  = params[:cross_selected].to_i
    gene_length     = params[:gene_length].to_i 

    point = rand(1..gene_length-1)
    puts 'Cross point: ' + point.to_s
    for i in 0..cross_selected-1
      puts population[i][0]
      puts population[i+1][0]
      cross1 = population[i+1][0].to_s[0..point] + ':' + population[i][0].to_s[point+1..gene_length-1]
      cross2 = population[i][0].to_s[0..point] + ':' + population[i+1][0].to_s[point+1..gene_length-1]
      population[i][0].individual    = s_to_a(cross1)
      population[i+1][0].individual    = s_to_a(cross2)
      puts "Salvo: " + population[i][0].to_s
      puts "Salvo: " + population[i+1][0].to_s
    end
    population
  end

  def self.s_to_a(gene)
    gene.split("").map { |s| s.to_i }
  end
end
