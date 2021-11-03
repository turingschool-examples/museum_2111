class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(new_exhibit)
    @exhibits.push(new_exhibit)
  end

  def recommended_exhibits(patrons)
    matching_exhibit = []
      @exhibits.each do |exhibit|
        patrons.interests.each do |interest|
        if exhibit.name == interest
          matching_exhibit.unshift(exhibit)
        end
      end
    end
      matching_exhibit
  end
end
