require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'pry'
require 'Rspec'


describe Museum do
  describe "this will test the Museum class" do
    it "checks the functionality" do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns.name).to eq("Denver Museum of Nature and Science")
      expect(dmns.exhibits).to eq([])
    end

    it "has interclass functionality with exhibits" do
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
      
    end
  end
end
