require 'RSpec'
require './lib/exhibit'
require 'pry'
RSpec.describe Exhibit do
  it 'exists' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    # binding.pry
    expect(exhibit).to be_a(Exhibit)
  end

  it 'has a name' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
     #binding.pry
    expect(exhibit.name).to eq("Gems and Minerals")
  end

  it 'has a cost' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    # binding.pry
    expect(exhibit.cost).to eq(0)
  end
end
