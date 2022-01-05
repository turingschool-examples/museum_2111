class Museum
  attr_reader :name, :exhibits ,:patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    reccommendation = []
    patron.interests.select do |interest|
      @exhibits.select do |exhibit|
        if exhibit.name == interest
          reccommendation << exhibit
        end
      end
    end
    reccommendation.uniq
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patron_hash = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        patron.interests.each do |interest|
          # require "pry"; binding.pry
          if exhibit.name == interest
            patron_hash[exhibit] = patron
          end
        end
      end
      return patron_hash.uniq
    end
  end
end
# patron_interests = @patrons.each do |patron|
#   patron.interests.each do |interest|
#     require "pry"; binding.pry
#   end
# end
