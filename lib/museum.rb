

class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(topic)
    @exhibits.push(topic)
  end

  def recommend_exhibits(patron)
    recommended = []
    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
        if exhibit.name == interest
          recommended.push(exhibit)
        end
      end
    end.flatten
    recommended
  end
  def admit(patron)
    @patrons.push(patron)
  end
end
