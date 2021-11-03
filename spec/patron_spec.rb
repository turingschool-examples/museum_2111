require './lib/exhibit'
require './lib/patron'

RSpec.describe 'it exists' do
  it 'creates a patron' do
    patron_1 = Patron.new('Bob', 20)

    expect(patron_1).to be_a(Patron)
  end
  context '#attributes' do
    it 'has a name ' do
      patron_1 = Patron.new('Bob', 20)
      expect(patron_1.name).to eq('Bob')
    end
    it 'has spending_money ' do
      patron_1 = Patron.new('Bob', 20)
      expect(patron_1.spending_money).to eq(20)
    end
    it 'has interests' do
      patron_1 = Patron.new('Bob', 20)
      expect(patron_1.interests).to eq([])
    end
  end
  context '#add_interests' do
    it 'can add inerests' do
      patron_1 = Patron.new('Bob', 20)
      patron_1.add_interest('Dead Sea Scrolls')
      patron_1.add_interest('Gems and Minerals')

      expect(patron_1.interests).to eq(['Dead Sea Scrolls', 'Gems and Minerals'])
    end
  end
end
