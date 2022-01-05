require './lib/exhibit'

RSpec.describe 'Exhibit' do
	before(:each) do
		exhibit_attributes = { name: 'Gems and Minerals', cost: 0 }
    @exhibit = Exhibit.new(exhibit_attributes)
	end

  it 'is initialized with a name and a cost' do
    expect(@exhibit).to be_instance_of Exhibit
    expect(@exhibit.name).to be_instance_of String
    expect(@exhibit.name).to eq 'Gems and Minerals'
    expect(@exhibit.cost).to be_instance_of Integer
    expect(@exhibit.cost).to eq 0
	end
end
