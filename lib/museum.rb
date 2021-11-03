class Museum
  attr_reader :name
  attr_accessor :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    recommendations = @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons.push(patron)
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}


    @exhibits.each do |exhibit|
      patrons_by_exhibit[exhibit] = []
    end

    @patrons.each do |patron|

    end

  end



  def  ticket_lottery_contestants

  end



end
