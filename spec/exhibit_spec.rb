require './lib/exhibit.rb'

RSpec.describe Exhibit do

  it 'exists' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    expect(exhibit).to be_instance_of(Exhibit)
  end

  it 'can see museum name' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    expect(exhibit.name).to eq("Gems and Minerals")
  end

  it 'can see museum cost' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    expect(exhibit.cost).to eq(0)
  end

end
