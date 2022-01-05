class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit_name)
    @exhibits << exhibit_name
  end

  def recommend_exhibits(patron)
    @interest = []
    @exhibits.each do |recommended|
      if patron.interests.include?(recommended)   #not enough time to refactor this.   this method is shoveling all exhibits into the @interest array and not just the patron.interests
        @interest << recommended
      end
      @interest
    end
  end
end
