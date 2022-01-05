require './lib/exhibit.rb'
require './lib/patron.rb'


RSpec.describe Patron do

  it 'exists' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_instance_of(Patron)
  end

  it 'can see patron name' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.name).to eq("Bob")
  end

  it 'can see patron spending limit' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.spending_money).to eq(20)
  end

  it 'checks patrons interests' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.interests).to eq([])
  end

  it 'checks add patrons interests' do
    patron_1 = Patron.new("Bob", 20)

    patron_1.add_interest("Dead Sea Scrolls")

    patron_1.add_interest("Gems and Minerals")

    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end

end
