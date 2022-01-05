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
    patron.interests.map do |interest|
      @exhibits.select do |exhibit|
        exhibit.name == interest
  end
 end
end
  def admit(patron)
    @patrons.push(patron)
  end

  def patrons_by_exhibit_interest
    exhibit_interest = {}
    @exhibits.map do |exhibit|
      exhibit_interest[exhibit] = @patrons.select {|patron| patron.interests.include?(exhibit.name)}
    end
    exhibit_interest
  end

  def ticket_lottery_contestants(exhibit)
    lotto_contestants = []
  end

end
