require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe 'Museum' do

  it 'museum exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns).to be_an_instance_of(Museum)
  end

  it 'museum has a name' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns.name).to eq()
  end

  it 'has exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])
  end

  it 'can add exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.exhibits).to eq([])
  end



end
