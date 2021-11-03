require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do

  before(:all) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@dmns).to be_an_instance_of(Museum)
    end

    it 'has default values' do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
      expect(@dmns.exhibits).to be_empty
    end
  end

  describe '#add_exhibit' do
    it 'can add exhibits to the museum' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expected = []@dmns.exhibits[0], @dmns.exhibits[1], @dmns.exhibits[2]]

      expect(@dmns.exhibits).to eq(expected)
    end
  end
end
