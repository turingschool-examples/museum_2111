require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")

    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})

  end

  it 'exists' do
    expect(@dmns).to be_instance_of(Museum)
  end

  it 'has attributes' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    expect(@dmns.exhibits).to eq([])
  end

  it 'can add exhibits' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
  end

  it 'can recommend exhibits to patrons based on their interests' do
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)

    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")

    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    expect(@dmns.recommend_exhibits(@patron_1)).to eq([@dead_sea_scrolls, @gems_and_minerals])
    expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
  end

  it 'can admit patrons' do
    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")

    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("Dead Sea Scrolls")

    @patron_3 = Patron.new("Johnny", 5)
    @patron_3.add_interest("Dead Sea Scrolls")

    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
  end

  it 'can sort patrons by exhibit interest' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Gems and Minerals")
    @patron_1.add_interest("Dead Sea Scrolls")

    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("Dead Sea Scrolls")

    @patron_3 = Patron.new("Johnny", 5)
    @patron_3.add_interest("Dead Sea Scrolls")

    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)
    expect(@dmns.patrons_by_exhibit_interest).to eq({@gems_and_minerals => [@patron_1],
                                                    @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3]
                                                    @imax => []})
  end 
end
