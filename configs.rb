require 'csv'

# Load and initialize all parameters 
class Configs
  ##
  # Metaclass for getters and setters of class variables.
  # Parameters can be accessed through params. Example:
  # - Mutation Rate: Defs.params[mutation_rate]
  class << self
    attr_accessor :params               # Hash with all configuration parameters
  end
  
  # Set new values for the parameters.
  def self.load(params)
    @params = params
  end
  
  # Set new values for the parameters or start them with default values from a CSV file.
  def self.load_from_file(filename='ga.ini')
    file    = CSV.read(filename)
    @params = Hash[file.map{|(k,v)| [k.to_sym, v]}] 
  end    
end # Config Class end

