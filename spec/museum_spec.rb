require './lib/museum'

describe Museum do

  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = double("Gems and Minerals")
    allow(@gems_and_minerals).to receive(:name).and_return("Gems and Minerals")
    @dead_sea_scrolls = double("Dead Sea Scrolls")
    allow(@dead_sea_scrolls).to receive(:name).and_return("Dead Sea Scrolls")
    @patron_1 = double("Bob")
    allow(@patron_1).to receive(:interests).and_return(["Gems and Minerals"])
    @patron_2 = double("Sally")
    allow(@patron_2).to receive(:interests).and_return(["Gems and Minerals", "Dead Sea Scrolls"])
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
      expect(@dmns.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals])
      expect(@dmns.recommend_exhibits(@patron_2)).to eq([@gems_and_minerals, @dead_sea_scrolls])
    end
  end

end
