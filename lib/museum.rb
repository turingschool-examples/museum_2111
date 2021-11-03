class Museum
  attr_reader :name,
              :exhibits,
              :patrons,
              :patrons_by_exhibit_interest

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patrons_by_exhibit_interest = {}
  end

  def add_exhibit(new_exhibit)
    @exhibits.push(new_exhibit)
  end

  def recommended_exhibits(patrons)
    matching_exhibit = []
      @exhibits.each do |exhibit|
        patrons.interests.each do |interest|
        if exhibit.name == interest
          matching_exhibit.unshift(exhibit)
        end
      end
    end
    # require "pry"; binding.pry
    # @patrons_by_exhibit_interest = matching_exhibit.group_by do |exhibit|
    #exhibit
    #end
    # patron not within the hash when used up here .... 
    matching_exhibit
  end

  # def patrons_by_exhibit_interest
  #   @matching_exhibit.group_by do |exhibit, patrons|
  #     need more practice with hash set ups
  #     require "pry"; binding.pry
  #     exhibit.name
  #   # # require "pry"; binding.pry
  #   # isnt liking interests being used in the method above
  #   # recommended_exhibits(patrons).group_by do |exhibit|
  #   # exhibit.name
  #   end
  # end

  def admit(new_patron)
    @patrons.push(new_patron)
  end
end
