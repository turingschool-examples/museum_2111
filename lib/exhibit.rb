class Exhibit
  attr_reader :name, :cost

  def initialize(ex)
    @name = ex.fetch(:name)
    @cost = ex.fetch(:cost)
  end
end
