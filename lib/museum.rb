require 'pry'
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
    recommendation = []
    @exhibits.each do |exhibit|
      if patron.interests.any?(exhibit.name)
        recommendation << exhibit
      end
    end
    recommendation
  end

  def admit(patron)
    if patron.spending_money
  end
end
