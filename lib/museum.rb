class Museum
  attr_reader :name,
              :exhibits,
              :patrons,
              :matching_exhibit

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @matching_exhibit = []
  end

  def add_exhibit(new_exhibit)
    @exhibits.push(new_exhibit)
  end

  def recommended_exhibits(patrons)
    @matching_exhibit = []
      @exhibits.each do |exhibit|
        patrons.interests.each do |interest|
        if exhibit.name == interest
          @matching_exhibit.unshift(exhibit)
        end
      end
    end
      @matching_exhibit
  end

  def patrons_by_exhibit_interest
    # # require "pry"; binding.pry
    # isnt liking interests being used in the method above
    # recommended_exhibits(patrons).group_by do |exhibit|
    # exhibit.name
    # end
  end

  def admit(new_patron)
    @patrons.push(new_patron)
  end
end
