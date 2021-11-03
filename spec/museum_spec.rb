require './lib/exhibit'
require './lib/patron'
require './lib/museum'

describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
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

  describe '#add_exhibits' do
    it 'tests proper addition of exhibits' do
      expect(@dmns.exhibits).to eq([])
      @dmns.add_exhibit(@gems_and_minerals)
      expect(@dmns.exhibits).to eq([@gems_and_minerals])
      @dmns.add_exhibit(@dead_sea_scrolls)
      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls])
      @dmns.add_exhibit(@imax)
      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end
  end
  describe '#exhibits' do
    it 'returns the exhibits added at the museum' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end
end
