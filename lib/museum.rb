require './lib/patron'
class Museum
  attr_reader :name, :exhibits, :patron

  def initialize(name)
    @name = name
    @exhibits = []
    @patron = patron
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits; end
end
