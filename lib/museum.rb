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
    recommend_array = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recommend_array << exhibit
      end
    end
    recommend_array
  end

  def admit(patron)
    @patrons << patron
  end
end
