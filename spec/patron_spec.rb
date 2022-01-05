require 'pry'
require './lib/exhibit'
require './lib/patron'
require 'rspec'


RSpec.describe Patron do
  it 'can create patrons' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_an_instance_of(Patron)
  end

  it 'can give patrons names' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.name).to eq("Bob")
  end

  it 'can let the patron spend money' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.spending_money).to be(20)
  end

  it 'can list a patrons interests' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.interests).to eq([])
  end

  it 'can add to patrons interests' do
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end
