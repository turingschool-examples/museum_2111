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

  describe '#add_exhibits' do
		before(:each) do
			@gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
			@dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
			@imax = Exhibit.new({name: "IMAX",cost: 15})
			@museum.add_exhibit(@gems_and_minerals)
			@museum.add_exhibit(@dead_sea_scrolls)
			@museum.add_exhibit(@imax)
		end

			it 'contains the Exhibits inside an array' do
				@museum.exhibits.each do |exhibit|
					expect(exhibit).to be_instance_of Exhibit
				end
			end
	end
end
