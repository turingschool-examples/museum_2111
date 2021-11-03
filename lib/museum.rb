require './lib/patron'
require './lib/exhibit'

class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
    @exhibits = @exhibits.sort_by{|exhibit| exhibit.name}
  end

  def recommend_exhibits(patron)
    exhibits_of_interest = @exhibits.find_all{|exhibit| patron.interests.include?(exhibit.name)}
    exhibits_of_interest.sort_by{|exhibit| exhibit.name}
  end

  def admit(patron)
    @patrons << patron
    @patrons = @patrons.sort_by{|patron| patron.name}
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit_interest = Hash.new()
    @exhibits.each do |exhibit|
      interested_patrons = @patrons.find_all{|patron| patron.interests.include?(exhibit.name)}
      patrons_by_exhibit_interest[exhibit] = interested_patrons
    end
    return patrons_by_exhibit_interest
  end
end
