class Museum

  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patrons)
    reccomend = []
    @exhibits.each do |exhibit|
        patrons.interests.each do |patron|
          if patron.include?(exhibit.name)
            reccomend.push(exhibit)
          end
        end
      end
      return reccomend
    end
  end
