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
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons.push(patron)
  end

  def patron_interests(exhibit)
    @patrons.find_all do |patron|
      patron.interests.include?(exhibit.name)
    end
  end

  def patrons_by_exhibit_interest
    patrons_by_interest = Hash.new
    @exhibits.each do |exhibit|
      patrons_by_interest[exhibit] = patron_interests(exhibit)
    end
    patrons_by_interest
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.find_all do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    names = ticket_lottery_contestants(exhibit).map do |ticket|
      ticket.name
    end
    names.sample
  end
end
