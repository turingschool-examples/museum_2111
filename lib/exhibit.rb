
class Exhibit
  attr_reader :name, :exhibit_info, :cost
  def initialize(exhibit_info)
    @exhibit_info = exhibit_info
    @name = @exhibit_info[:name]
    @cost = @exhibit_info[:cost]
  end

end
