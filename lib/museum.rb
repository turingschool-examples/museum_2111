class Museum

  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end


  def recommend_exhibits(patron)
    recommended_exhibits = []
    interests = patron.interests
    @exhibits. each do |exhibit|
      interests. each do |interest|
        if exhibit.name == interest
          recommended_exhibits << exhibit
        end
      end
    end

    recommended_exhibits
  end
end
