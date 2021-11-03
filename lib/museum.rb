require './lib/patron'
require './lib/exhibit'

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
    recommended = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recommended << exhibit
      end
    end
    recommended
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.map do |exhibit|
      @patrons.group_by do |patron|
        recommend_exhibits(patron)
      end
    end
  end
end
