class Exhibit
  attr_accessor :name, :cost

  def initialize (details)
    @name = details[:name]
    @cost = details[:cost]
  end
end
