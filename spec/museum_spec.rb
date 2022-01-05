require './lib/museum'
require './lib/exhibit'
require './lib/patron'

RSpec.describe do
  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
  let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
  let(:imax) {Exhibit.new({name: "IMAX",cost: 15})}
  let(:patron_1) {Patron.new("Bob", 20)}
  let(:patron_2) {Patron.new("Sally", 20)}

  it "exists" do
    expect(dmns).to be_a Museum
  end

  it "has a name" do
    expect(dmns.name).to eq "Denver Museum of Nature and Science"
  end

  it "can have exhibits" do
    expect(dmns.exhibits).to eq []
  end
end
