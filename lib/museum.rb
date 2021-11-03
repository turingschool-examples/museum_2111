class Museum
  attr_reader :name
  attr_accessor :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    recommendations = @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

end
