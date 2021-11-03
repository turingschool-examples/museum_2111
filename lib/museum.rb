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
    recommended_exhibits = []
    interests = patron.interests
    @exhibits. each do |exhibit|
      interests. each do |interest|
        if exhibit.name == interest
          recommended_exhibits << exhibit
        end
      end
    end

    recommended_exhibits
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    return_hash = {}

    @exhibits.each do |exhibit|
      patrons_for_exhibit = []

      patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          patrons_for_exhibit << patron.name
        end

      return_hash[exhibit.name] = patrons_for_exhibit
      end
    end

    return_hash
  end

  def ticket_lottery_contestants(exhibit)
    patrons_interested = []

    patrons.each do |patron|
      if patron.interests.include?(exhibit.name) && patron.spending_money < exhibit.cost
        patrons_interested << patron
      end
    end

    patrons_interested
  end


end
