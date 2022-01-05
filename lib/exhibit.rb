class Exhibit

  attr_reader :name, :cost
  def initialize(info)
    @name = info[:name]
    @cost = info[:cost].to_i
  end
end
