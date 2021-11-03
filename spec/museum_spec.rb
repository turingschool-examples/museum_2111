require './lib/patron'
require './lib/exhibit'
require './lib/museum'

describe Museum do
  before(:each) do
    @museum = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("IMAX")
  end
  describe 'initialize' do
    it 'exists' do
      expect(@museum).to be_a(Museum)
    end

    it 'has_attributes' do
      expect(@museum.name).to eq("Denver Museum of Nature and Science")
      expect(@museum.exhibits).to eq([])
    end
  end

  describe ' methods' do
    describe ' #add_exhibits' do
      it 'adds new exhibit to exhibits' do
        expect(@museum.exhibits).to eq([])
        @museum.add_exhibit(@gems_and_minerals)
        expect(@museum.exhibits).to eq([@gems_and_minerals])
        @museum.add_exhibit(@dead_sea_scrolls)
        expect(@museum.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls])
        @museum.add_exhibit(@imax)
        expect(@museum.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
      end
    end
    describe ' #recommend_exhibits' do
      it 'returns an array of exhibits that the patron has interest in' do
        expect(@museum.recommend_exhibits(@patron_1)).to eq([@dead_sea_scrolls, @gems_and_minerals])
        expect(@museum.recommend_exhibits(@patron_2)).to eq([@imax])
      end
    end
  end
end
