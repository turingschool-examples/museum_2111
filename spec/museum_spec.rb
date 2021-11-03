require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do

  before(:all) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@dmns).to be_an_instance_of(Museum)
    end

    it 'has default values' do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
      expect(@dmns.exhibits).to be_empty
      expect(@dmns.patrons).to be_empty
    end
  end

  describe '#add_exhibit' do
    it 'can add exhibits to the museum' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      expected = [@dmns.exhibits[0], @dmns.exhibits[1], @dmns.exhibits[2]]

      expect(@dmns.exhibits).to eq(expected)
    end
  end

  describe '#recommend_exhibits' do
    it 'will recommend exhibits matching a persons interests' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)

      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("IMAX")

      expected = [@dead_sea_scrolls, @gems_and_minerals]

      expect(@dmns.recommend_exhibits(@patron_1)).to eq(expected)

      expected = [@imax]

      expect(@dmns.recommend_exhibits(@patron_2)).to eq(expected)
    end
  end

  describe '#admit' do
    it 'will admit patrons to the museum' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)

      expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
    end
  end

  describe '#patrons_interested' do
    it 'returns the patrons interested in an exhibit' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @patron_1.add_interest("Gems and Minerals")
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")

      expect(@dmns.patrons_interested("Dead Sea Scrolls")).to eq([@patron_1, @patron_2, @patron_3])
    end
  end

  describe '#patrons_by_exhibit_interest' do
    xit 'list patrons who are interested in an exhibit' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      @dmns.add_exhibit(@imax)
      @patron_1.add_interest("Gems and Minerals")
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")
      expected = {
        @gems_and_minerals => [@patron_1],
        @dead_sea_scrolls => [@patron_1, @patron_2, @patron_3],
        @imax => []
      }

      expect(@dmns.patrons_by_exhibit_interest).to eq(expected)
    end
  end
end
