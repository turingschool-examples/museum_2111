require './lib/patron.rb'
require 'rspec'

RSpec.describe Patron do
  it '1* exists' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1).to be_a(Patron)
  end

  it '2* has attributes' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to eq(20)
    expect(patron_1.interests).to eq([])
  end

  it '3* can add interests' do
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)

    patron_1.add_interest("IMAX")
    patron_2.add_interest("Dead Sea Scrolls")

    expect(patron_1.interests).to eq(["IMAX"])
    expect(patron_2.interests).to eq(["Dead Sea Scrolls"])

  end
end
