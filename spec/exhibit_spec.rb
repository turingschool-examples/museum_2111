require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do
  it 'exists' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

  it ' has a name' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    expect(exhibit.name).to eq('Gems and Minerals')
  end

  it ' has a cost' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    expect(exhibit.cost).to eq(0)
  end
end

RSpec.describe Patron do
  it 'exists' do
    patron_1 = Patron.new('Bob', 20)
    expect(patron_1).to be_an_instance_of(Patron)
  end

  it 'has a name' do
    patron_1 = Patron.new('Bob', 20)
    expect(patron_1.name).to eq('Bob')
  end

  it 'has spending money' do
    patron_1 = Patron.new('Bob', 20)
    expect(patron_1.spending_money).to eq(20)
  end

  it 'has interests' do
    patron_1 = Patron.new('Bob', 20)
    expect(patron_1.interests).to eq([])
  end

  it 'has interests' do
    patron_1 = Patron.new('Bob', 20)
    patron_1.add_interest('Dead Sea Scrolls')
    patron_1.add_interest('Gems and Minerals')
    expect(patron_1.interests).to eq(['Dead Sea Scrolls', 'Gems and Minerals'])
  end
end
