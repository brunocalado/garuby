require 'csv'

def block(sep="=", message=nil)
  puts sep*20
  puts message if not message==nil
end

# Save population to CSV file.
def save_pop(population, filename="out.csv", operation='w')
  CSV.open(filename, operation) do |csv|
    for i in 0..population.length-1
      csv << [population[i][0], population[i][1]]
    end
    csv << [""]
  end
end

# Restore population saved on CSV file
def restore_pop

end

# Convert a binary array to a integer number
# puts "Decimal: " + bin_to_int(@individual).to_s
def bin_to_int(gene)
  out = ''
  gene.each {|n| out+=n.to_s}
  out.to_i(2)
end

# Convert a integer number to binary array.
# @individual = int_to_bin(7)
def int_to_bin(gene)
  gene.to_s(2).split("").map { |s| s.to_i }
end
