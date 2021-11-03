require './lib/museum'

describe Museum do

  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = double("Gems and Minerals")
    allow(@gems_and_minerals).to receive(:name).and_return("Gems and Minerals")
    allow(@gems_and_minerals).to receive(:cost).and_return(0)
    @dead_sea_scrolls = double("Dead Sea Scrolls")
    allow(@dead_sea_scrolls).to receive(:name).and_return("Dead Sea Scrolls")
    allow(@dead_sea_scrolls).to receive(:cost).and_return(10)
    @imax = double("IMAX")
    allow(@imax).to receive(:name).and_return("IMAX")
    allow(@imax).to receive(:cost).and_return(15)
    @patron_1 = double("Bob")
    allow(@patron_1).to receive(:interests).and_return(["Gems and Minerals", "Dead Sea Scrolls"])
    allow(@patron_1).to receive(:spending_money).and_return(0)
    @patron_2 = double("Sally")
    allow(@patron_2).to receive(:interests).and_return(["Dead Sea Scrolls"])
    allow(@patron_2).to receive(:spending_money).and_return(20)
    @patron_3 = double("Johnny")
    allow(@patron_3).to receive(:interests).and_return(["Dead Sea Scrolls"])
    allow(@patron_3).to receive(:spending_money).and_return(5)

    # @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    # @imax = Exhibit.new({name: "IMAX",cost: 15})
  end

  describe '#initialize' do
    it 'has a name' do
      expect(@dmns.name).to eq("Denver Museum of Nature and Science")
    end
    it 'starts with no exhibits' do
      expect(@dmns.exhibits).to eq([])
    end
  end

  describe '#add_exhibit' do
    it 'adds an exhibit' do
      @dmns.add_exhibit(@gems_and_minerals)
      expect(@dmns.exhibits).to eq([@gems_and_minerals])
    end
  end

  describe '#recommend_exhibits' do
    it 'returns a recommend exhibit' do
      @dmns.add_exhibit(@gems_and_minerals)
      @dmns.add_exhibit(@dead_sea_scrolls)
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@dead_sea_scrolls])
    end
  end

  describe '#admit' do
    it 'admits a patron' do
      @dmns.admit(@patron_1)
      @dmns.admit(@patron_2)
      @dmns.admit(@patron_3)
      expect(@dmns.patrons).to eq([@patron_1, @patron_2, @patron_3])
    end
  end

  describe '#patrons_by_exhibit_interest' do
    it 'returns a hash of patrons by their interests' do
      expected = {
        "Gems and Minerals" => [@patron_1],
        "Dead Sea Scrolls" => [@patron_1, @patron_2, @patron_3],
        "IMAX" => []
      }
      expect(@dmns.patrons_by_exhibit_interest).to eq(expected)
    end
  end

end
