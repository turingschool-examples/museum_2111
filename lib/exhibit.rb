class Exhibit
  attr_reader :name, :cost, :name_and_cost 
  def initialize(name_and_cost)
    @name = name_and_cost[:name]
    @cost = name_and_cost[:cost]
    @name_and_cost = name_and_cost
  end
end
