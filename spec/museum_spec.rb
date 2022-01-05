require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  before(:each) do
    # @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    # @patron_1 = Patron.new("Bob", 20)
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  it 'exists' do
    expect(@dmns).to be_instance_of Museum
  end

  it 'has name' do
    expect(@dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it 'has exhibits - yields empty array' do
    expect(@dmns.exhibits).to eq([])
  end
end

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)
    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("IMAX")
  end

  it 'has exhibits - yields array full of exhibit objects' do
  expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
  end

  it 'recommends exhibit to equal gems and dead sea for Patron 1' do
  expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
  end

  it 'has patrons yields empty array' do
  expect(@dmns.patron).to eq([])
  end


end
