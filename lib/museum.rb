class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name     = name
    @exhibits = []
    @patrons  = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    #for each patron's interest (array)
    #check if interest matches with exhibit's name (array of hashes)
    #if true, hash needs to be added to array
    #if false, next hash should be compared
    @exhibits.select do |exhibit|
      patron.interests.any? do |interest|
        exhibit.name == interest
      end
    end
  end

  def admit(patron)
    @patrons << patron
  end
end
