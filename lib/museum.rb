class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def recommend_patrons(exhibit)
    @patrons.find_all do |patron|
      require 'pry'
      binding.pry
      exhibit.name == patron.insterests
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    exhibits_hash = {}
    patrons_exhibits = []

    @patrons.map do |patron|
      patrons_exhibits << recommend_exhibits(patron)
    end

    the_patrons = []
    @exhibits.each do |exhibit|
      the_patrons << exhibit
    end

    exhibits_hash[patrons_exhibits] = the_patrons
  end
end
