require './lib/patron'

RSpec.describe Patron do
  before(:each) do
    @patron = Patron.new("Bob", 20)
	end

	it 'is initialized with a name and an amount of spending money' do
		expect(@patron).to be_instance_of Patron
		expect(@patron.name).to be_instance_of String
		expect(@patron.name).to eq 'Bob'
		expect(@patron.spending_money).to be_instance_of Integer
		expect(@patron.spending_money).to eq 20
	end

	it 'can hold a collection of interests' do
		expect(@patron.interests).to be_instance_of Array
	  expect(@patron.interests).to be_empty
	end

	it 'can add interests' do
		@patron.add_interest("Dead Sea Scrolls")
		@patron.add_interest("Gems and Minerals")

		expect(@patron.interests).to eq ["Dead Sea Scrolls", "Gems and Minerals"]
	end
end
