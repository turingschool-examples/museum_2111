class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name = "no name")
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    h = Hash.new([])
    @patrons.each do |pat|
      pat.interests.each do |int|
        @exhibits.each do |exhib|
          if int == exhib.name
            h[exhib].push(pat)
          end
        end
      end
    end
    h  # Why is this coming back empty???
  end
end
