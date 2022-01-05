require 'pry'
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
    recommend_array = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name)
        recommend_array << exhibit
      end
    end
    recommend_array

  end
end
