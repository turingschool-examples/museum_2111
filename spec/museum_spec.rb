require './lib/patron'
require './lib/exhibit'
require './lib/museum'
require 'pry'

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end
  it 'will create an instance of Museum' do
    expect(@dmns).to be_instance_of(Museum)
  end
  it 'will have a name attribute' do
    expect(@dmns.name).to eq('Denver Museum of Nature and Science')
  end
  describe 'exhibits' do
    it 'will initially have no exhibits' do
      expect(@dmns.exhibits).to eq([])
    end
    it 'can add exhibits' do
      @dmns.add_exhibit(@imax)
    end
    it 'will add exhibits to array' do
      @dmns.add_exhibit(@imax)
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      expect(@dmns.exhibits).to eq([@imax, @gems_and_minerals, @dead_sea_scrolls])
    end 
  end



end
