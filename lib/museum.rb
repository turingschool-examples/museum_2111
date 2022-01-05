class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def admit(patron)
    @patrons << patron
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      exhibits if patron.interests.include?(exhibit.name)
    end
  end

  def patrons_by_exhibit_interest
    by_exhibit_hash = Hash[@exhibits.collect {|exhibit| [exhibit.name, []]}]
    by_exhibit_hash.keys.each do |key|
      by_exhibit_hash[key] 
    @patrons.select do |patron|
      by_exhibit_hash[patron
  end
end
