require './lib/patron.rb'
require './lib/exhibit'
require './lib/museum'
require 'rspec'
require 'pry'

RSpec.describe Museum do

  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
  let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
  let(:imax) {Exhibit.new({name: "IMAX",cost: 15})}
  let(:patron_1) {Patron.new("Bob", 0)}
  let(:patron_2) {Patron.new("Sally", 20)}
  let(:patron_3) {Patron.new("Johnny", 5)}

  it '1* exists' do

    expect(dmns).to be_a(Museum)
  end

  it '2* has attributes' do

    expect(dmns.name).to eq("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])
  end


  it '3* can add exhibits' do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
  end

  it '4* has an array of patrons' do

    expect(dmns.patrons).to eq([])
  end

  it '5* can add patrons' do
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
    expect(dmns.patrons).to eq([patron_1, patron_2, patron_3])
  end

  it 'can arrange patrons by exhibit interest' do
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    patron_2.add_interest("Dead Sea Scrolls")
    patron_3.add_interest("Dead Sea Scrolls")
    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)
  binding.pry
    # expected = {
    #
    # }

    expect(dmns.patrons_by_exhibit_interest).to eq(true)

  end




end
