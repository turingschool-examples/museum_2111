class Exhibit
  attr_reader :name, :cost

  def initialize(name, cost = 0)
    @name = "Gems and Minerals"
    @cost = cost
  end

  # def names
  #   exhibits_array = exhibits.flat_map do |exhibit|
  #     exhibit.name
  #   end.uniq
  # end
end
