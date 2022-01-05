require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do
  before(:each) do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @patron_1 = Patron.new("Bob", 20)
  end

  it 'exists' do
    expect(@patron_1).to be_instance_of Patron
  end

  it 'has name' do
    expect(@patron_1.name).to eq("Bob")
  end

  it 'has spending money' do
    expect(@patron_1.spending_money).to eq(20)
  end

  it 'has interests - yield empty array' do
    expect(@patron_1.interests).to eq([])
  end

  it 'has interests - yields 2 data points' do
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end
