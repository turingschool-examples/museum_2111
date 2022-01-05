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

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      # require "pry"; binding.pry
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def have_interests(patron)
    @epatrons.select do |patron|
      patron.interests.include?(exhibit.name)
  end

  def patrons_by_exhibit_interest
    result_hash = {}
    @exhibits.each do |exhibit|
      @patrons.select do |patron|
        if result_hash[exhibit].nil?
          result_hash[exhibit] = phave_interests(patron)
          require "pry"; binding.pry
     end
    end
    end
    result_hash

  end

end
