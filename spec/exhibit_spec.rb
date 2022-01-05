require './lib/exhibit'
require 'pry'

RSpec.describe Exhibit do
  before(:each) do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end
  it 'creates an instance of Exhibit' do
    expect(@exhibit).to be_instance_of(Exhibit)
  end
  it 'has a name attribute' do
    expect(@exhibit.name).to eq("Gems and Minerals")
  end
  it 'has a cost attribute' do
    expect(@exhibit.cost).to eq(0)
  end 
end
