require './lib/museum'
require './lib/exhibit'
require './lib/patron'

RSpec.describe Museum do
  before(:each) do
    @museum = Museum.new("Denver Museum of Nature and Science")
  end

  it 'exists' do
    expect(@museum).to be_instance_of(Museum)
  end

  it 'can read museum name' do
    expect(@museum.museum_name).to eq("Denver Museum of Nature and Science")
  end

  it 'can initialize empty exhibits array' do
    expect(@museum.exhibits).to eq([])
  end

  it 'can initialize empty patron array' do
    expect(@museum.patrons).to eq([])
  end

  it 'can #admit patrons to patron[]' do
    patron_1 = Patron.new("Sally", 20)
    patron_2 = Patron.new("Bob", 20)

    expected = [patron_1, patron_2]

    @museum.admit(patron_1)
    @museum.admit(patron_2)

    expect(@museum.patrons).to eq(expected)
  end

  it 'can #add_exhibit into exhibits[]' do
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    @museum.add_exhibit(gems_and_minerals)
    @museum.add_exhibit(dead_sea_scrolls)
    @museum.add_exhibit(imax)

    expected = [gems_and_minerals, dead_sea_scrolls, imax]

    expect(@museum.exhibits).to eq(expected)
  end

  it 'can #recommend_exhibits to an inputted patron' do
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    @museum.add_exhibit(gems_and_minerals)
    @museum.add_exhibit(dead_sea_scrolls)
    @museum.add_exhibit(imax)

    patron_1 = Patron.new("Sally", 20)
    patron_2 = Patron.new("Bob", 20)

    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    patron_2.add_interest("IMAX")

    expected_one = [gems_and_minerals, dead_sea_scrolls]
    expected_two = [imax]

    expect(@museum.recommend_exhibits(patron_1)).to eq(expected_one)
    expect(@museum.recommend_exhibits(patron_2)).to eq(expected_two)
  end

  it 'can return #patrons_by_exhibit_interest as a hash' do
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    @museum.add_exhibit(gems_and_minerals)
    @museum.add_exhibit(dead_sea_scrolls)
    @museum.add_exhibit(imax)

    patron_1 = Patron.new("Sally", 20)
    patron_2 = Patron.new("Bob", 20)
    patron_3 = Patron.new("Johnny", 5)

    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Gems and Minerals")
    patron_3.add_interest("Dead Sea Scrolls")

    @museum.admit(patron_1)
    @museum.admit(patron_2)
    @museum.admit(patron_3)

    expected = {

      gems_and_minerals => [patron_2],
      dead_sea_scrolls => [patron_1, patron_3],
      imax => []

    }
    require 'pry'; binding.pry
    expect(@museum.patrons_by_exhibit_interest).to eq(expected)
  end

end
