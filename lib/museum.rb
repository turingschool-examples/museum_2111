require './lib/patron'
require './lib/exhibit'

class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patrons_by_interest = Hash.new {|hash, key| hash[key] = []}
    @patrons_of_exhibits = Hash.new {|hash, key| hash[key] = []}
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron_interests = @exhibits.select do |exhibit|
      exhibit.name if patron.interests.include?(exhibit.name)
    end
    patron_interests
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.each do |exhibit|
      @patrons_by_interest[exhibit]
      @patrons.each do |patron|
        @patrons_by_interest[exhibit] << patron if patron.interests.include?(exhibit.name)
      end
    end
    @patrons_by_interest
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest
    pool = @patrons_by_interest[exhibit]
    final_pool = pool.select do |patron|
       patron.spending_money < exhibit.cost
    end
    final_pool
  end

  def draw_lottery_winner(exhibit)
    pool = ticket_lottery_contestants(exhibit)
    pool.sample
  end
end
