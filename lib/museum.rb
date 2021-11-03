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
    exhibit_names = []
    @exhibits.each do |exhibit|
      exhibit_names << exhibit.name
    end
    exhibit_names & patron.interests
  end

  # For patrons_by_exhibit_interest, this method takes no arguments and returns a Hash where each key is an Exhibit. The value associated with that Exhibit is an Array of all the Patrons that have an interest in that exhibit.
end
