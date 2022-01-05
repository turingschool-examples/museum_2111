class Museum

  attr_reader :name, :exhibit

  def initialize(name)
    @name = name
    @exhibit = []
    @recommend_exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibit << exhibit
  end

  def recommend_exhibits(patron)
    @recommend_exhibits << patron.interests
  end

end
