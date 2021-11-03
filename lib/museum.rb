class Museum
  attr_reader :name,
              :exhibits,
              :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(new_exhibit)
    @exhibits << new_exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.any?(exhibit)
    end
  end

  def interested(exhibit)
    @patrons.find_all do |patron|
      patron.interests.any?(exhibit)
    end
  end

  def admit(incoming)
    @patrons << incoming
  end

  def patrons_by_exhibit_interest
    exhibits_patrons = Hash.new
      @exhibits.each do |exhibit|
         exhibits_patrons[exhibit] = interested(exhibit)
       end
     exhibits_patrons
  end
end
