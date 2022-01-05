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
    #for each patron's interest (array)
    #check if interest matches with exhibit's name (array of hashes)
    #if true, hash needs to be added to array
    #if false, next hash should be compared
    @exhibits.select do |exhibit|
      patron.interests.any? do |interest|
        exhibit.name == interest
      end
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    #exhibit instances stored in an array
    #patron instances stored in an array
    #for each exhibit name that a patron is interested
    #exhibit must be a unique key (?), value must be array of selected patrons
  end

  def ticket_lottery_contestants(exhibit)
    #call helper method patrons_by_exhibit_interest by using exhibit instance as key
    #sample from array to return a single winner
  end

  def draw_lottery_winner(exhibit)
    #call helper method patrons_by_exhibit_interest by using exhibit instance as key
    #if array == 0, return nil (?)
  end
end
