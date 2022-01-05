require './lib/exhibit.rb'
require './lib/patron.rb'
require './lib/museum.rb'

RSpec.describe Museum do

  it 'exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns).to be_instance_of(Museum)
  end

  it 'can see museum name' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it 'can add museum exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns.exhibit).to eq([])
  end

  it 'can see museum exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expect(dmns.exhibit).to eq([gems_and_minerals, dead_sea_scrolls, imax])
  end

  it 'can recommend museum exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    patron_1 = Patron.new("Bob", 20)

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    patron_2 = Patron.new("Sally", 20)

    patron_2.add_interest("IMAX")
    require 'pry' ; binding.pry

    expect(dmns.recommend_exhibits(patron_1)).to eq["Dead Sea Scrolls", "Gems and Minerals"]
    expect(dmns.recommend_exhibits(patron_2)).to eq["IMAX"]

  end

end
