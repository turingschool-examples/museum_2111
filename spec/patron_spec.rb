require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do

  before(:each)do
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})

  end

  it 'exists' do
    expect(@patron_1).to be_an_instance_of(Patron)
  end

  it 'has a name' do
    expect(@patron_1.name).to eq("Bob")
  end

  it 'has a cost' do
    expect(@patron_1.spending_money).to eq(20)
  end

  it 'can add interests' do
    @patron_1.add_interest(@exhibit.name)
    @patron_1.add_interest(@dead_sea_scrolls.name)
    @patron_2.add_interest(@imax.name)


    expect(@patron_1.interests).to eq([@exhibit.name, @dead_sea_scrolls.name])
    expect(@patron_2.interests).to eq([@imax.name])
  end

end
