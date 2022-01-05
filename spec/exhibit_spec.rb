require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do

  let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:patron_1) {Patron.new("Bob", 20)}

  it 'exists' do
  expect(exhibit).to be_a(Exhibit)
  end

  it 'has a name' do
  expect(exhibit.name).to eq("Gems and Minerals")
  end

  it 'has a cost' do
  expect(exhibit.cost).to eq(0)
  end

  it 'exists' do
  expect(patron_1).to be_a(Patron)
  end

  xit 'has a name' do
  expect(patron_1.name).to eq("Bob")
  end

  xit 'has money to blow' do
    expect(patron_1.spending_money).to eq(20)
  end

  xit 'can have interests' do
    expect(patron_1.interests).to eq([])
  end

  xit 'can add interests' do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end
