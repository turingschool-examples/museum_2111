class Museum

  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests.map do |interests|
      # binding.pry
      @exhibits.select do |exhibit|
        exhibit.name == interests
      end
    end.flatten
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    Hash.new(0)
    #need to add to make test more robust and accurate
    #needs to map the exhibits and match with patron with interest in exhibit
  end

  def ticket_lottery_contestants(exhibit)
  end

  def draw_lottery_winner(exhibit)
  end
end
