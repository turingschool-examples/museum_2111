require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
  before(:each) do
		@museum = Museum.new("Denver Museum of Nature and Science")
	end

	it 'is initialized with a name' do
    expect(@museum).to be_instance_of Museum
		expect(@museum.name).to be_instance_of String
		expect(@museum.name).to eq 'Denver Museum of Nature and Science'
	end

	it 'contains an array to hold
	 Exhibits' do
	  expect(@museum.exhibits).to   be_instance_of Array
	  expect(@museum.exhibits).to be_empty
	end
end
