class Museum
  attr_reader :name, :exhibits
  def initialize(name, exhibits = [])
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    # recommended_exhibits = []
    # exhibits_interested = patron.interests.find_all do |interest|
    #   exhibit_names
    # end
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name) == true
    end
  end


  # def recommend_exhibits(patron)
  #   recommended_exhibits = []
  #   exhibit_names = @exhibits.map do |exhibit|
  #     exhibit[:name]
  #   end
  #   patron.interests.find do |interest|
  #     interest == exhibit_names
  #   end
  #   recommended_exhibits
  # end
end
