require 'pry'
class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit_name)
    @exhibits << exhibit_name
  end

  def recommend_exhibits(patron)
    recommendations = []
    @exhibits.select do |exhibit|
      patron.interests.each do |interest|
        recommendations << exhibit if exhibit.name == interest
      end
    end
    recommendations
  end

  def admit(patron)
    @patrons << patron
  end
end
