require './lib/patron'

RSpec.describe Patron do
  let(:patron_1) { Patron.new('Bob', 20) }

  describe '#initialize' do
    it 'exists' do
      expect(patron_1).to be_a(Patron)
    end

    it 'has a name' do
      expect(patron_1.name).to eq('Bob')
    end

    it 'has spending money' do
      expect(patron_1.spending_money).to eq(20)
    end

    it 'has no interests initially' do
      expect(patron_1.interests).to eq([])
    end
  end

  describe '#add_interest' do 
    it 'can add an interest to interests array' do
      patron_1.add_interest('Dead Sea Scrolls')
      patron_1.add_interest('Gems and Minerals')
      
      expected = ['Dead Sea Scrolls', 'Gems and Minerals']
      expect(patron_1.interests).to eq(expected)
    end
  end
end