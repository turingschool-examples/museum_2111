
class Patron
  attr_reader :name, :spending_money, :interests

  def initialize(name, cash, interests = [])
    @name = name
    @spending_money = cash
    @interests = interests
  end

  def add_interest(interest)
    @interests << interest
  end
end
