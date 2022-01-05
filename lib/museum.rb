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

  def patrons_by_exhibit_interest
    exhibit_interests = Hash.new
    @exhibits.each do |exhibit|
      symbol = exhibit.name.gsub(" ", "_").to_sym
      exhibit_interests[symbol] = []
    end
    @patrons.each do |patron|
      exhibit_interests.keys.each do |key|
        if patron.interests.include?(key)
          exhibit_interests[key] = patron
        end
      end
    end
    exhibit_interests
    #binding.pry
  end
end
