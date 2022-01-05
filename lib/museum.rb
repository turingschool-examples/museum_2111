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
    recommendation = []
    @exhibits.each do |exhibit|
      if patron.interests.any?(exhibit.name)
        recommendation << exhibit
      end
    end
    recommendation
  end

end
