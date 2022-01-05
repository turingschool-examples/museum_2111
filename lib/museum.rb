require './lib/patron'
require './lib/exhibit'

class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @patrons_by_interest = Hash.new {|hash, key| hash[key] = []}
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

dmns = Museum.new("Denver Museum of Nature and Science")
gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
imax = Exhibit.new({name: "IMAX",cost: 15})
dmns.add_exhibit(gems_and_minerals)
dmns.add_exhibit(dead_sea_scrolls)
dmns.add_exhibit(imax)
patron_1 = Patron.new("Bob", 0)
patron_1.add_interest("Gems and Minerals")
patron_1.add_interest("Dead Sea Scrolls")
patron_2 = Patron.new("Sally", 20)
patron_2.add_interest("Dead Sea Scrolls")
patron_3 = Patron.new("Johnny", 5)
patron_3.add_interest("Dead Sea Scrolls")
dmns.admit(patron_1)
dmns.admit(patron_2)
dmns.admit(patron_3)
p dmns.ticket_lottery_contestants(dead_sea_scrolls)
