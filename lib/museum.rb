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
    @exhibits.append(exhibit)
  end

  def recommend_exhibits(patron)
    recommend = []
    @exhibits.each do |exhibit|
      if patron.interests.include?(exhibit.name) == true
        recommend.append(exhibit)
      end
    end
    recommend
  end

  def admit(patron)
    @patrons.append(patron)
  end

  def patrons_by_exhibit_interest
    exhibit_hash = Hash.new
    recommended = []
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          exhibit_hash[exhibit] = patron
        end
      end
    end
    exhibit_hash
  end

  def ticket_lottery_contestants(exhibit)
    contestants = []
    @patrons.each do |patron|
      if patron.spending_money < exhibit.cost
        contestants << patron
      end
    end
    contestants
  end

  def draw_lottery_winner(exhibit)
    field = ticket_lottery_contestants(exhibit)
    winner = field.shuffle.first
    if winner = nil
      puts nil
    else
      winner.name
    end  
  end

end
