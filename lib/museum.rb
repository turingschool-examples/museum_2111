class Museum
  attr_reader :name,
              :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests.each do |interest|
      patron_int = interest
      @reccomended = @exhibits.find_all do |exhibit|
        exhibit.name == patron_int
      end
    end
    @reccomended
  end
end


  # def exhibit_names
  #   @exhibits.map do |exhibit|
  #     exhibit.name
  #   end
