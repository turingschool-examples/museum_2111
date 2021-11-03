require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do

  let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:patron_1) {Patron.new("Bob", 20)}

  describe '#intialize' do
    it 'has a name' do
      expect(patron_1.name).to eq "Bob"
    end

    it 'has spending money' do
      expect(patron_1.spending_money).to eq 20
    end

    it 'has array of interests empty at start' do
      expect(patron_1.interests).to eq([])
    end
  end

  describe '#add_interest' do
    it 'adds item to interest array' do
      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")
      
      expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end
  end

end
