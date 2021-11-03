require './lib/patron'

RSpec.describe Patron do
  it 'exists' do
    patron = Patron.new("Bob", 20)
  end

  it 'can read patron name' do
    patron = Patron.new("Bob", 20)
    expect(patron.name).to eq("Bob")
  end

  it 'can read patron money' do
    patron = Patron.new("Bob", 20)
    expect(patron.money).to eq(20)
  end
end
