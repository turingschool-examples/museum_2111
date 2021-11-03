class Patron

  attr_reader :name,
              :spending_money,
              :interests

  def initialize(name, spending_money)
    @name = name
    @spending_money = spending_money
    @interests = []
  end

  def add_interest(interest)
    @interests << interest
  end

  def self.search_patrons
    h = Hash.new
    h[Patron.interests] = Patron.name
  end
end
