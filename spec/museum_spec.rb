require './lib/exhibit'
require './lib/patron'

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

  it 'patron has money and interests' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to be 20
    expect(patron_1.interests).to eq([])
  end
end
