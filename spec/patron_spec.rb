require './lib/exhibit'
require './lib/patron'

RSpec.describe do

  it 'exists' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1).to be_a(Patron)
  end

  it 'retrieves name' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.name).to eq("Bob")
  end

  it 'retrieves spending money' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.spending_money).to eq(20)
  end

  it 'has no interests by default' do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1.interests).to eq([])
  end

end
