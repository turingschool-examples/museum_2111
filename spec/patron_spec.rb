require './lib/patron'
require './lib/exhibit'

describe Patron do
  before(:each) do
    @patron = Patron.new("Bob", 20)
  end
  describe 'initialize' do
    it 'exists' do
      expect(@patron).to be_a(Patron)
    end

    it 'has_attributes' do
      expect(@patron.name).to eq("Bob")
      expect(@patron.spending_money).to eq(20)
      expect(@patron.interests).to eq([])
    end
  end

  describe ' methods' do
    describe ' #add_interests' do
      it 'adds new interest to interest' do
        expect(@patron.interests).to eq([])
        @patron.add_interest("Dead Sea Scrolls")
        expect(@patron.interests).to eq(["Dead Sea Scrolls"])
        @patron.add_interest("Gems and Minerals")
        expect(@patron.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
      end
    end
  end
end
