class Museum

  attr_reader :museum_name, :exhibits
  def initialize(museum_name)
    @museum_name = museum_name
    @exhibits = []
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

    # Return recommended exhibits
    patron_exhibits.compact
  end

end
