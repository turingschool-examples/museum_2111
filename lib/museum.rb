class Museum

  attr_reader :museum_name, :exhibits, :patrons
  def initialize(museum_name)
    @museum_name = museum_name
    @exhibits = []
    @patrons = []
  end

  # Push exhibits into exhibits[] array
  def add_exhibit(exhibit_object)
    @exhibits << exhibit_object
  end

  def recommend_exhibits(patron_object)
    patron_exhibits = []

    # Look through museum exhibits and find matches with all patron interests
    # Map all matches and push into patron_exhibits[]
    @exhibits.map do |exhibit|
      patron_object.interests.map do |interest|
        # require 'pry'; binding.pry
        if exhibit.exhibit_name == interest
          patron_exhibits << exhibit
        end
      end
    end

    # Return recommended exhibits (remove any nil values from mapping)
    patron_exhibits.compact
  end

end
