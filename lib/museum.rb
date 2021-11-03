class Museum

  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibit(patron)
    recommended_exhibits = []
    patron.interests.map do |interest|
      @exhibits.each do |exhibit|
        if exhibit.name == interest
          recommended_exhibits << interest
        end
      end
    end
    recommended_exhibits
  end
end
