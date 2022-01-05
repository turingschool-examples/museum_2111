require 'RSpec'
require './lib/museum'
require './lib/exhibit'
require './lib/patron'
require 'pry'

RSpec.describe Patron do

  it 'exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    # binding.pry
    expect(dmns).to be_a(Museum)
  end

  xit 'has a name' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    # binding.pry
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
  end

  xit 'has no exhibits by default' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    # binding.pry
    expect(dmns.exhibits).to eq([])
  end

  xit 'can add exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    # binding.pry
    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
  end

  xit 'can recommend exhibits to patrons' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("IMAX")

    # binding.pry
    expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
    expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
  end
end
