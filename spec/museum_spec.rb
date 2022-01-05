require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  subject { Museum.new("Denver Museum of Nature and Science") }
  before(:each) do
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
  end
  context "iteration-2" do
    it "exists" do
      expect(subject.name).to eq("Denver Museum of Nature and Science")
      expect(subject.exhibits).to eq([])
    end
  end
end
