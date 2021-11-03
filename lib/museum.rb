class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
  end

  def recommend_exhibits(patron)
    exhibit_names = []
    @exhibits.each do |exhibit|
      exhibit_names << exhibit.name
    end
    exhibit_names & patron.interests
  end

  # For patrons_by_exhibit_interest, this method takes no arguments and returns a Hash where each key is an Exhibit. The value associated with that Exhibit is an Array of all the Patrons that have an interest in that exhibit.

# if exhibit.name == patron.interest
  # hash[exhibit] += 1

  def patrons_by_exhibit_interest
    hash = Hash.new
    @exhibits.each do |exhibit|
      hash[exhibit] = 0
    end

    all_interests = @patrons.map do |patron|
      patron.interests
    end.flatten

    hash.each do |exhibit|
      all_interests.each do |interest|
        if exhibit[0].name == interest
          hash[exhibit[0]] += 1
        end
      end
    end
    hash

  end

end
