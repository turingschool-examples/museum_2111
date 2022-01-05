class Exhibit
  attr_reader :name, :cost

  def initialize(hash_info)
    @name = hash_info[:name]
    @cost = hash_info[:cost]
  end
end
