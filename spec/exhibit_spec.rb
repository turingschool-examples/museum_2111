require './lib/exhibit'

RSpec.describe Exhibit do
  before(:each) do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end
  it 'has a name attribute' do
    expect(@exhibit.name).to be("Gems and Minerals")
  end
