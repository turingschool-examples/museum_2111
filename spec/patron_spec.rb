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
end
