require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do
  it 'exists' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  end

  it 'has a name and cost' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit.name).to eq("Gems and Minerals")
    expect(exhibit.cost).to be 0
  end
end
