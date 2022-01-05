require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Exhibit do
  it 'exists' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit).to be_instance_of(Exhibit)
  end

  it 'has a name and cost' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit.name).to eq("Gems and Minerals")
    expect(exhibit.cost).to be 0
  end

  it 'has a patron' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1).to be_instance_of(Patron)
  end

  it 'patron has money and no interests' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to be 20
    expect(patron_1.interests).to be_empty
  end

  it 'patron adds interests' do
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end

  it 'has a museum' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns).to be_instance_of(Museum)
  end

  it 'has a museum' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it 'has no exhibits initially' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to be_empty
  end

  it 'adds exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])

  end
end
