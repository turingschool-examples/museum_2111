require './lib/exhibit'
require './lib/patron'
require './lib/museum'

describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2.add_interest("IMAX")
    @patron_3.add_interest("Dead Sea Scrolls")
    @expected = {
      @gems_and_minerals => [@patron_1],
      @dead_sea_scrolls => [@patron_1, @patron_3],
      @imax => [@patron_2]
    }
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

  describe '#recommended_exhibits' do
    it 'returns exhibits that are recommended based on the patrons interests' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
    end
  end

  describe '#patrons_by_exhibit_interest' do
    it 'returns a hash with exhibit keys and patrons who are interestsed in it' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons_by_exhibit_interest).to eq(@expected)
    end
  end

  describe '#ticket_lottery_contestants' do
    it 'returns an array of patrons that dont have enough money for the exibit' do

    end
  end
end
