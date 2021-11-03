class Exhibit
  def initialize(exhibit)
    @exhibit = exhibit
  end

  def name
    @exhibit[:name]
  end

  def cost
    @exhibit[:cost]
  end 
end
