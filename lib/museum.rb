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

  def lowest_cost
    costs = @exhibits.map do |exhibit|
      exhibit.cost
    end
    sorted = costs.sort
    sorted.shift
  end

  def admit(patron)
    if patron.spending_money > lowest_cost
      @patrons << patron
    end
  end
end
