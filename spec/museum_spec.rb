require './lib/exhibit'
require './lib/patron'
require './lib/museum'

describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  describe '#initialize' do
    it 'creates and instance of museum' do
      expect(@dmns).to be_a Museum
    end

    it 'returns the name of the museum' do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    end

    it 'returns the exhibits at the museum in an array' do
      expect(@dmns.exhibits).to eq([])
    end
  end
end 
