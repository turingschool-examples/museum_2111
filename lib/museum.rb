require './lib/patron'
require './lib/exhibit'

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
    patron_interests = @exhibits.select do |exhibit|
        exhibit.name if patron.interests.include?(exhibit.name)
    end
    patron_interests
  end
end
