require './lib/museum'
require './lib/exhibit'
require './lib/patron'

RSpec.describe Museum do
  before(:each) do
    @museum = Museum.new("Denver Museum of Nature and Science")
  end

  it 'exists' do
    expect(@museum).to be_instance_of(Museum)
  end

  it 'can read museum name' do
    expect(@museum.museum_name).to eq("Denver Museum of Nature and Science")
  end

  it 'can initialize empty exhibits array' do
    expect(@museum.exhibits).to eq([])
  end



  it 'can #add_exhibit into exhibits[]' do
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    @museum.add_exhibit(gems_and_minerals)
    @museum.add_exhibit(dead_sea_scrolls)
    @museum.add_exhibit(imax)

    expected = [gems_and_minerals, dead_sea_scrolls, imax]

    expect(@museum.exhibits).to eq(expected)
  end
end
