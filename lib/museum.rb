class Museum
  attr_reader :name
  attr_accessor :exhibits, :patrons

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
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    interest_hash = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        interest_hash[exhibit] ||= []
        if recommend_exhibits(patron).include?(exhibit)
          interest_hash[exhibit].push(patron)
        end
      end
    end
  interest_hash
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest[exhibit].select do |patron|
      patron.spending_money < exhibit.cost
    end
  end
end
