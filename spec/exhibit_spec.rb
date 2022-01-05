require './lib/exhibit'
require './lib/patron'

RSpec.describe do
  it 'exists' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    expect(exhibit).to be_a(Exhibit)
  end

  it 'has a name' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    expect(exhibit.name).to eq('Gems and Minerals')
  end

  it 'has a cost' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    expect(exhibit.cost).to eq(0)
  end

  # Patron
  it 'has a patron' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    patron_1 = Patron.new('Bob', 20)
    expect(patron_1.name).to eq('Bob')
  end

  it 'has a patron with spending money' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    patron_1 = Patron.new('Bob', 20)
    expect(patron_1.spending_money).to eq(20)
  end

  it 'has a patron with no interests' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    patron_1 = Patron.new('Bob', 20)
    expect(patron_1.interests).to eq([])
  end

  it 'has a patron with interests' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    patron_1 = Patron.new('Bob', 20)
    patron_1.add_interest('Dead Sea Scrolls')
    patron_1.add_interest('Gems and Minerals')
    expect(patron_1.interests).to eq(['Dead Sea Scrolls', 'Gems and Minerals'])
  end
end
