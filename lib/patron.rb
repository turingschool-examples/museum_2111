class Patron
  attr_reader :name, :money
  def initialize(name, money)
    @name = name
    @money = money
    @interests = []
  end


end
