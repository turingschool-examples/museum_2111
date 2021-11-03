class Museum

  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
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

  def admit(patron)
    @patrons.append(patron)
  end 
end
