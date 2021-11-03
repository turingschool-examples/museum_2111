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

  it 'can initialize an empty interest array' do
    patron = Patron.new("Bob", 20)
    expect(patron.interests).to eq([])
  end

  it '#add_interest' do
    patron = Patron.new("Bob", 20)
    patron.add_interest("Dead Sea Scrolls")
    patron.add_interest("Gems and Minerals")

    expected = ["Dead Sea Scrolls", "Gems and Minerals"]

    expect(patron.interests).to eq(expected)
end
