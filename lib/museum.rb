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
    exhibits_of_interest = @exhibits.find_all{|exhibit| patron.interests.include?(exhibit.name)}
    exhibits_of_interest.sort_by{|exhibit| exhibit.name}
  end
end
