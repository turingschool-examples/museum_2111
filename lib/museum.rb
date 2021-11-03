class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name     = name
    @exhibits = []
    @patrons  = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    reco = []
    exhibits.each do |exhibit|
      patron.interests.each do |interest|
        if exhibit.name == interest
          reco << exhibit
        end
      end
    end
    reco.uniq
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    pbei = Hash.new
    exhibits.each do |exhibit|
      pbei[exhibit] = []
      require "pry"; binding.pry
    end
  end
end