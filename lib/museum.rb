class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include? exhibit.name
    end
  end

  def admit(patron)
    @patrons << patron
  end

  #not yet functional 
  # def patrons_by_exhibit_interest
  #   @exhibits.group_by do |exhibit|
  #     exhibit => recommended_exhibits(patron)
  #   end
  # end

end
