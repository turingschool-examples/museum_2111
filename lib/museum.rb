class Museum
  attr_reader :name, :exhibits, :patrons, :patrons_by_exhibit_interest
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patrons_by_exhibit_interest = {}
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recomended_exibits = []
    patron.interests.each do |interest|
      exhibits.each do |exhibit|
        if interest == exhibit.name
          recomended_exibits << exhibit
        end
      end
    end
    recomended_exibits
  end

  def admit(patron)
    patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.each do |exhibit|
      @patrons_by_exhibit_interest[exhibit] = []
    end
    patrons.each do |patron|
      recommend_exhibits(patron).each do |recomended_exibit|
      if @patrons_by_exhibit_interest[exhibit] == recommend_exhibit
        @patrons_by_exhibit_interest[recommend_exhibit] = patron
        end
      end
    end
  end
end
