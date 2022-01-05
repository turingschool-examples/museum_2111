require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  before(:each) do
    # @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    # @patron_1 = Patron.new("Bob", 20)
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end

  it 'exists' do
    expect(@dmns).to be_instance_of Museum
  end

  it 'has name' do
    expect(@dmns).to eq("Denver Museum of Nature and Science")
  end
end
