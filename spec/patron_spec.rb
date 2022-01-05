require './lib/exhibit'
require './lib/patron'
require 'pry'
require 'Rspec'


describe Patron do
  describe "this will test the Patron class" do
    it "checks the functionality" do
      patron_1 = Patron.new("Bob", 20)
      expect(patron_1.name).to eq("Bob")
      expect(patron_1.spending_money).to eq(20)
      expect(patron_1.interests).to eq([])
    end
  end
end
