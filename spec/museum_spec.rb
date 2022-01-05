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
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
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
  describe 'Reccomendations' do
    it 'will provide reccomendations to patrons' do
      @dmns.add_exhibit(@imax)
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("IMAX")
      expect(@dmns.reccomended_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(@dmns.reccomended_exhibits(@patron_2)).to eq([@imax])
    end
  end
  describe "Patrons" do
    it 'initially has no patrons' do
      expect(@dmns.patrons).to eq([])
    end
    it 'can admit patrons' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
    end
    it 'will create a hash with the exhibit and an array of interested patrons' do
      @dmns.add_exhibit(@imax)
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons_by_exhibit_interest).to eq({
        @gems_and_minerals => [@patron_1],
        @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3],
        @imax => []
        })
      end
    end

end
