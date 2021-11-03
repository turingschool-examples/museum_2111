class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    @recommendations = []
    patron.interests.each do |interest|
      self.exhibits.each do |exhibit|
        if exhibit.name == interest
          @recommendations.push(exhibit)
        end
      end
    end
    @recommendations
  end

  def admit(patron)
    @patrons.push(patron)
    @patrons
  end

  def patrons_by_exhibit_interest
    # @sort = []
    # self.exhibits.group_by do |exhibit|
    #   self.patrons.map do |patron|
    #     @sort = patron.interests.find_all do |interest|
    #       interest == exhibit.name
    #     end
    #   end
    #   @sort
    # end
  # end

    @sort = []
    @sorted_patrons = {}
    self.exhibits.map do |exhibit|
      self.patrons.map do |patron|
        patron.interests.map do |interest|
          if interest == exhibit.name
            @sorted_patrons[exhibit] = @sort.push(patron)
          else
            @sorted_patrons[exhibit] = @sort
          end
        end
      end
    end
    @sorted_patrons
  end
end
