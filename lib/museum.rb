class Museum
  attr_accessor :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end
  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def reccomended_exhibits(patron)
    reccomendations = []
    @exhibits.each do |exhibit|
      patron.interests.each do |interest|
        if exhibit.name == interest
          reccomendations << exhibit
        end
      end
    end
    return reccomendations
  end
  def admit(patron)
    @patrons << patron
  end
  def patrons_by_exhibit_interest
    interests_hash = Hash.new{|h,k| h[k] = []}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patron.interests.include?(exhibit.name)
          interests_hash[exhibit] << patron
        elsif patron.interests.include?(exhibit.name) == false && interests_hash[exhibit].empty?
          interests_hash[exhibit] = []
        end
      end
    end
    return interests_hash
  end
end
