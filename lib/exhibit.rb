class Exhibit

  attr_reader :name, :cost
  def initialize(name: 'name', cost: 'cost')
    @name = name
    @cost = cost
  end

  
end
