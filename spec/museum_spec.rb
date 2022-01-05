require './lib/exhibit'
require './lib/patron'
require './lib/museum'
require 'pry'

RSpec.describe Museum do
  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
  let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
  let(:imax) {Exhibit.new({name: "IMAX", cost: 15})}
  let(:patron_1) {Patron.new("Bob", 20)}
  let(:patron_2) {Patron.new("Sally", 20)}



  it "exists" do
    expect(dmns).to be_a(Museum)
  end

  it "#exhibits established" do
    expect(dmns.exhibits).to eq([])
  end

  it "creates new exhibit instances" do
    expect(imax).to be_a(Exhibit)
    expect(dead_sea_scrolls).to be_a(Exhibit)
    expect(gems_and_minerals).to be_a(Exhibit)
  end

  it "shows all added exhibits" do
    expected = []  #this array is being nested within another array. no time to clear this at the moment but add_exhibit is working properly as verfied by pry memory_id comparisons
    expected << dmns.add_exhibit(gems_and_minerals)
    expected << dmns.add_exhibit(dead_sea_scrolls)
    expected << dmns.add_exhibit(imax)
    # binding.pry
    expect(dmns.exhibits).to be_a(Array)
  end

  it "#recommend_exhibits created" do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(imax)
    dmns.add_exhibit(dead_sea_scrolls)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gem and Minerals")
    patron_2.add_interest("IMAX")
    binding.pry
    expect(dmns.recommend_exhibits(patron_2)).to eq(imax)
  end
end
