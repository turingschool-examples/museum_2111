class Exhibit

  attr_reader :exhibit_name, :exhibit_cost
  def initialize(exhibit_info)
    @exhibit_name = exhibit_info[:name]
    @exhibit_cost = exhibit_info[:cost]
  end

  
end
