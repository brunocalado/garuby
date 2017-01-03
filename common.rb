require 'csv'

def block(sep="=", message=nil)
  puts sep*20
  puts message if not message==nil
end

# Save population to CSV file. 
def save_pop(population)
  CSV.open("out.csv", "w") do |csv|
    for i in 0..population.length-1
      csv << [population[i][0], population[i][1]]
    end
  end  
end

# Restore population saved on CSV file
def restore_pop
  
end