class Museum
  attr_reader :name, :exhibits
  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end


  def recommend_exhibits(patron)
    exhibits.find_all do |exhibit|
      patron.interests.include? exhibit.name
      # require "pry"; binding.pry
      # patron.interests.each do |interest|
      # interest == exhibit.name
      # require "pry"; binding.pry
      end
    end
  end




  # oh god it's making duplicates
  # this thing needs to reset for every new patron
  # and NOT push an existing one.... can do uniq?
  # why does it keep pushing all the interests into the
  # array

  # def recommend_exhibits(patron)
  #   custom_recs = Array.new
  #   # I don't know how to compare each item from one
  #   # thing to each item in another thing.....
  #   # this nested iteration is difficult.
  #   exhibits.find_all do |exhibit|
  #     patron.interests.each do |interest|
  #       unless interest != exhibit.name
  #         custom_recs.push(exhibit)
  #         require "pry"; binding.pry
  #       end
  #     end
  #     custom_recs.uniq
  #   end
  # end
