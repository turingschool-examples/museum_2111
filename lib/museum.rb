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
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_with_certain_interest(exhibit)
    @patrons.find_all do |patron|
      patron.interests.include?(exhibit.name)
    end
  end

  def patrons_by_exhibit_interest
    patrons_group = {}
    @exhibits.each do |exhibit|
      patrons_group[exhibit] = patrons_with_certain_interest(exhibit)
    end
    patrons_group
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    ticket_lottery_contestants(exhibit).map do |patron|
      patron.name
    end.sample
  end
end
