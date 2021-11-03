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
    @exhibits.select do |exhibit|
      patron.interests.any? do |interest|
        exhibit.name == interest
      end
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_interested_in(exhibit)
    @patrons.select do |patron|
      patron.interests.any? do |interest|
        interest == exhibit.name
      end
    end
  end

  def patrons_by_exhibit_interest
    exhibit_interest_hash = {}
    exhibits.each do |exhibit|
      exhibit_interest_hash[exhibit] = patrons_interested_in(exhibit)
    end
    exhibit_interest_hash
  end

  def ticket_lottery_contestants(exhibit)
    @patrons.select do |patron|
      patron.spending_money < exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    possible_contestants = ticket_lottery_contestants(exhibit)
    if possible_contestants.count > 0
      possible_contestants.sample.name
    elsif possible_contestants == []
      nil
    end
  end
end
