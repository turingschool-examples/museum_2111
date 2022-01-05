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
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests.map do |interests|
      # binding.pry
      @exhibits.select do |exhibit|
        exhibit.name == interests
      end
    end.flatten
  end
end
