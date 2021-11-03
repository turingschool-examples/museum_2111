class Museum

  attr_reader :museum_name, :exhibits
  def initialize(museum_name)
    @museum_name = museum_name
    @exhibits = []
  end

  def add_exhibit(exhibit_object)
    @exhibits << exhibit_object
  end


end
