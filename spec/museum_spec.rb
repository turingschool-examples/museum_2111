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

		describe '#recommend_exhibits' do
			before(:each) do
				@patron1 = Patron.new("Bob", 20)
				@patron2 = Patron.new("Sally", 20)
				@patron1.add_interest("Dead Sea Scrolls")
				@patron1.add_interest("Gems and Minerals")
				@patron2.add_interest("IMAX")
			end

			it 'returns an array of recomended exhibits based on a patrons interest' do
				patron1_recs = @museum.recommend_exhibits(@patron1).map(&:name)
				patron2_recs = @museum.recommend_exhibits(@patron2).map(&:name)
				expect(@patron1.interests.all? do |interest|
					patron1_recs.include?(interest)
				end).to be true
				expect(@patron2.interests.all? do |interest|
					patron2_recs.include?(interest)
				end).to be true
			end
		end
	end
end
