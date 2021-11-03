require './lib/patron'

describe Patron do

  before(:each) do
    @patron_1 = Patron.new("Bob", 20)
  end

  describe '#initialize' do
    it 'has correct attributes' do
      expect(@patron_1.name).to eq("Bob")
      expect(@patron_1.spending_money).to eq(20)
    end
    it 'starts with no interests' do
      expect(@patron_1.interests).to eq([])
    end
  end

  describe '#add_interest' do
    it 'adds an interest to the interests array' do
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")

      expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end
  end

end
