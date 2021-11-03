class Exhibit
  attr_reader :name, :cost

  def initialize(hash_items)
    @name = hash_items[:name]
    @cost = hash_items[:cost]
  end
end
