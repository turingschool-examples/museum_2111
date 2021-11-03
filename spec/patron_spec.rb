require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do
  before :each do
    @patron_1 = Patron.new("Bob", 20)
  end

  it 'exsists' do
    expect(@patron1).to be_an_instance_of(Patron)
  end

  it 'has attributes' do
    expect(@patron1.name).to eq('Bob')
    expect(@patron1.spending_money).to eq(20)
    expect(@patron1.interests).to eq([])
  end

  it '#add_interest' do
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")

    expect(@patron1.interests).to eq(['Dead Sea Scrolls', 'Gems and Minerals'])
  end
end
