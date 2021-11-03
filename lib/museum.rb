class Museum
  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit_name)
    @exhibits.push(exhibit_name)
  end

  def recommend_exhibits(patron)
    @recommendations = []
    patron.interests.each do |interest|
      self.exhibits.each do |exhibit|
        if exhibit.name == interest
          @recommendations.push(exhibit)
        end
      end
    end
    @recommendations
  end
end
