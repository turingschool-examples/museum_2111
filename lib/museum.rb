class Museum
  attr_reader :name
  attr_accessor :exhibits, :recommend_exhibits

  def initialize(name)
    @name = name
    @exhibits = []
    @recommend_exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end


end
