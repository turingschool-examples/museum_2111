require './lib/exhibit'

describe Exhibit do

  before(:each) do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  describe '#initialize' do
    it 'has correct attributes' do
      expect(@exhibit.name).to eq("Gems and Minerals")
      expect(@exhibit.cost).to eq(0)
    end
  end

end
