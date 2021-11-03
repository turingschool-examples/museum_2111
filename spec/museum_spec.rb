require './lib/patron'
require './lib/exhibit'
require './lib/museum'

describe Exhibit do
  before(:each) do
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})

    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)

    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  it 'exists' do
    expect(@dmns).to be_a(Museum)
  end

  it 'has a name' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it 'has exhibits' do
    expect(@dmns.exhibits).to be_a(Array)
  end

  it 'adds exhibits' do
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    expect(@dmns.exhibits.count).to eq(3)
  end

  it 'recommends exhibits' do
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")

    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    expect(@dmns.recommend_exhibits(@patron_1).count).to eq(2)
    expect(@dmns.recommend_exhibits(@patron_2).count).to eq(1)
  end

  it 'adds patrons' do
    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)

    expect(@dmns.patrons.count).to eq(2)
  end

  it 'has patrons_by_exhibit_interest' do
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")
    @patron_3.add_interest("Dead Sea Scrolls")

    @dmns.admit(@patron_1)
    @dmns.admit(@patron_2)
    @dmns.admit(@patron_3)


    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    expect(@dmns.patrons_by_exhibit_interest).to be_a(Hash)
    # expect(dmns.patrons_by_exhibit_interest[]).to be_a(Hash)
  end
end
