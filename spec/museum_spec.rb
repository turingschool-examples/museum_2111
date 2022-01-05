require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  subject { Museum.new("Denver Museum of Nature and Science") }
  before(:each) do
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end
  context "iteration-2" do
    it "exists" do
      expect(subject.name).to eq("Denver Museum of Nature and Science")
      expect(subject.exhibits).to eq([])
    end

    it "can add exhibits" do
      subject.add_exhibit(@gems_and_minerals)
      subject.add_exhibit(@dead_sea_scrolls)
      subject.add_exhibit(@imax)
      expect(subject.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end

    it "recommends exhibits based on patron interests" do
      subject.add_exhibit(@gems_and_minerals)
      subject.add_exhibit(@dead_sea_scrolls)
      subject.add_exhibit(@imax)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("IMAX")
      expect(subject.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(subject.recommend_exhibits(@patron_2)).to eq([@imax])
    end
  end
end
