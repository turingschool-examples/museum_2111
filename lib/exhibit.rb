class Exhibit
  attr_reader :name,
              :cost,
              :patrons

  def initialize(info)
    @name = info[:name]
    @cost = info[:cost]
    @patrons = []
  end

  def add_patron(patron)
    if patron.spending_money < @cost
      nil
    elsif patron.spending_money >= @cost
      @patrons << patron
    end
  end

end
