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

	it '' do
	end

	it '' do
	end
end
