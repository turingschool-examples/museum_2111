class Exhibit
  attr_reader :name, :cost, :admitted_patrons
  def initialize(name_and_cost)
    @name = name_and_cost[:name]
    @cost = name_and_cost[:cost]
    @admitted_patrons = []
  end
end
