class Exhibit
  attr_reader :name,
              :cost

  def initialize(info)
    @name = info.fetch(:name)
    @cost = info.fetch(:cost)
  end
end
