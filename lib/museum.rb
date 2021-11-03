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
      @exhibits.find do |exhibit|
        exhibit.name == interest
      end
    end
  end

  def admit(patron)
    @patrons.push(patron)
  end

  def patrons_interested(exhibit)
    @patrons.select do |patron|
      patron.interests.include?(exhibit)
    end
  end

  def patrons_by_exhibit_interest
    exhibit_patrons = Hash.new([])
    @exhibits.each do |exhibit|
      exhibit_patrons[exhibit] = patrons_interested(exhibit.name)
    end
    exhibit_patrons
  end

  def ticket_lottery_contestants(exhibit)
    patrons_interested(exhibit.name).select do |patron|
      patron.spending_money < exhibit.cost
    end
  end
end
