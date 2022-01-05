require './lib/patron.rb'
require './lib/exhibit.rb'
require './lib/museum.rb'
require 'pry'

RSpec.describe Patron do

  it 'exists' do
  patron = Patron.new
  expect patron.to be_instance_of Patron
  end

  it 'has a name and money' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.name).to eq "Bob"
    expect(patron_1.spending_money).to be 20
  end

  it 'develops interests' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.interests).to eq []
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron_1.interests).to eq ["Dead Sea Scrolls", "Gems and Minerals"]
  end

end
