require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do
  before(:each) do
    @patron_1 = Patron.new("Bob", 20)
  end

  it 'Has a name' do
    expect(@patron_1.name).to eq("Bob")
  end

  it 'Can spend money' do
    expect(@patron_1.spedning_money).to eq(20)
  end

  
end
