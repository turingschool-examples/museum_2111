require './lib/exhibit'

describe Exhibit do
  before(:each) do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  describe '#initialize' do
    it 'creates an instance of Exhibit' do
      expect(@exhibit).to be_a Exhibit
    end

    it 'contains instance variable for name' do
      expect(@exhibit.name).to eq("Gems and Minerals")
    end

    it 'contains instance variable for cost' do
      expect(@exhibit.cost).to eq(0)
    end
  end
end
