class Patron
  attr_accessor :name, :spending_money

  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
    @interests = []
  end
end
