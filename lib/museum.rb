

class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(topic)
    @exhibits.push(topic)
  end

  def recommend_exhibits(patron)
    recommended = []
    patron.interests.each do |interest|
      @exhibits.each do |exhibit|
        if exhibit.name == interest
          recommended.push(exhibit)
        end
      end
    end.flatten
    recommended
  end
  def admit(patron)
    @patrons.push(patron)
  end
  def patrons_by_exhibit_interest
    exhibit_hash = Hash.new
    @exhibits.each do |exhibit|
      exhibit_hash[exhibit] = []
      @patrons.each do |patron|
        # require "pry"; binding.pry
        if patron.interests == [exhibit.name]
          exhibit_hash[exhibit] = exhibit_hash[exhibit] + patron
        end
      end
    end
    exhibit_hash
  end
end
