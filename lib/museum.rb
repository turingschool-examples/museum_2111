class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommended = exhibits.select do |exhibit|
      exhibit if patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit_interest = {}
    @exhibits.each do |exhibit|
      if !patrons_by_exhibit_interest.has_key?(exhibit)
          patrons_by_exhibit_interest[exhibit] = []
      end
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          patrons_by_exhibit_interest[exhibit] << patron
        end
      end
    end
    patrons_by_exhibit_interest
  end

  def ticket_lottery_contestants(exhibit)
    contestants = patrons_by_exhibit_interest[exhibit].map do |patron|
      patron.spending_money < exhibit.cost ? patron : next
    end.compact
  end

  def draw_lottery_winner(exhibit)
    winner = ticket_lottery_contestants(exhibit).sample
    winner == nil ? nil : winner.name
  end
end
