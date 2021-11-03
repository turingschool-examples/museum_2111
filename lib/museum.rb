class Museum

  attr_reader :name,
              :exhibits,
              :patron_list

  def initialize(name)
    @name = name
    @exhibits = []
    @patron_list = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibit(patron)
    recommended_exhibits = []
    patron.interests.map do |interest|
      @exhibits.each do |exhibit|
        if exhibit.name == interest
          recommended_exhibits << interest
        end
      end
    end
    recommended_exhibits
  end

  def add_patrons(patron)
    @patron_list << patron
  end

  def patrons_by_exhibit_interests #got tripped up here :(
    exhibit_interest_hash = Hash.new
    @exhibits.each do |exhibit|
      exhibit_interest_hash[exhibit] = []
    end

    @patron_list.each do |patron|
      if exhibit_interest_hash.keys.include?(patron.interests.map {|interest| interest})
        exhibit_interest_hash[interest] += patron.name
      end
    end
    #need access all Patrons by interest.
  end


end
