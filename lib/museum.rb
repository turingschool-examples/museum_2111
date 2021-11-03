class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibits
  end

  def recommended_exhibits(patron)
    @recommended = []
    @recommended << patron.interests
      # if patron.interests == exhibit.hash_items[:name]
      #   @recommended << exhibit.hash_items[:name]
      # end
  end
end
