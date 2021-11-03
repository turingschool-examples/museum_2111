require './lib/exhibit'

RSpec.describe Exhibit do
  it 'exists' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit).to be_instance_of(Exhibit)
  end

  it 'can read exhibit name' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit.exhibit_name).to eq("Gems and Minerals")
  end

  it 'can read exhibit cost' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit.exhibit_cost).to eq(0)
  end

end
