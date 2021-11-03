class Exhibit
  attr_reader :name, :cost
  def initialize(about_exhibit)
    @name = about_exhibit[:name]
    @cost = about_exhibit[:cost]
  end
end
