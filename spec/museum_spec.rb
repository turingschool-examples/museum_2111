require "./lib/museum"
require "./lib/exhibit"
require "./lib/patron"

RSpec.describe Musuem do

  it "exists" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns).to be_a(Museum)
  end

  it "attributes" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])
  end

  it "add exhibit" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.exhibits).to eq([gems_and_minerals,dead_sea_scrolls,imax])
  end

  it "reccomend exhibit" do
    dmns = Museum.new("Denver Museum of Nature and Science")
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")
    expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals,dead_sea_scrolls])
    expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
  end 
end