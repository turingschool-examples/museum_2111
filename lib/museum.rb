class Museum

  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits.append(exhibit)
  end

  def recommend_exhibits(patron)
    recommend = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name) == true
        recommend.append(exhibit)
      end
    end
    recommend
  end
end
