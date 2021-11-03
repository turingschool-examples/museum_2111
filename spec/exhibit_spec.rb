require './lib/exhibit'
require './lib/patron'
require "rspec"
let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
describe Exhibit do
  it 'exists' do
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

  it 'attributes' do
    expect(exhibit.name).to eq("Gems and Minerals")
    expect(exhibit.cost).to eq(0)
  end
end
