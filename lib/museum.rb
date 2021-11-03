

class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(topic)
    @exhibits.push(topic)
  end

  def recommend_exhibits(patron)
    #require "pry"; binding.pry
    recommended = patron.interests.map do |interest|
      @exhibits.each do |exhibit|
        if exhibit == interest
          recommended.push(exhibit)
        end
      end
    end.flatten
    recommended
  end
end
