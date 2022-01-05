require './lib/patron'
require './lib/exhibit'
require './lib/museum'
require 'rspec'
require 'pry'

RSpec.describe Museum do

  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
  let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
  let(:imax) {Exhibit.new({name: "IMAX",cost: 15})}

  context 'iteration II' do

    it "exists" do
      expect(dmns).to be_an_instance_of(Museum)
    end

    it "has attributes" do
      expect(dmns.name).to eq("Denver Museum of Nature and Science")
      expect(dmns.exhibits).to eq([])
    end

    it 'can #add_exhibit' do

    expect(dmns.exhibits).to eq([])
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    expect(dmns.exhibits.count).to eq(3)
  end
end
end
