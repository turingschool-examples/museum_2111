class Exhibit

attr_reader :name,
            :cost

  def initialize(museum_info)
    @name = "#{museum_info[:name]}"
    @cost = "#{museum_info[:cost]}"
  end



end
