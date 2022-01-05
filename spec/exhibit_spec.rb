require 'rspec'
require './lib/exhibit'
require './lib/patron'

describe Exhibit do
  before :each do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  it 'has a name' do
    expect(@exhibit.name).to eq("Gems and Minerals")
  end

  it 'has a cost' do
    expect(@exhibit.cost).to eq(0)
  end 
end
