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

  xit 'patron has money and no interests' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to be 20
    expect(patron_1.interests).to be_empty
  end

  xit 'patron adds interests' do
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron_1.interests).to eq["Dead Sea Scrolls", "Gems and Minerals"]
  end

  it 'has a museum' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns).to be_instance_of(Museum)
  end
end
