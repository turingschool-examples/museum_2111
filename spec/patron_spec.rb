require './lib/exhibit'
require './lib/patron'

describe Patron do
  before(:each) do
    @patron_1 = Patron.new("Bob", 20)
  end

  describe '#initialize' do
    it 'creates and instance of patron' do
      expect(@patron_1).to be_a Patron
    end

    it 'returns the patrons name' do
      expect(@patron_1.name).to eq("Bob")
    end

    it 'returns the patrons spending money' do
      expect(@patron_1.spending_money).to eq(20)
    end

    it 'returns the interests array instance variable' do
      expect(@patron_1.interests).to eq([])
    end
  end

  describe '#add_interest & #interests (retest)' do
    it 'adds interests to the patrons list of interests and interests returns them' do
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end
  end

end
