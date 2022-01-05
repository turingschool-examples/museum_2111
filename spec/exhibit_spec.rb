require './lib/exhibit'
require './lib/patron'
require 'pry'
require 'Rspec'


describe Exhibit do
  describe "this will test the Exhibit class" do
    it "checks the functionality" do
      exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
      expect(exhibit.name).to eq("Gems and Minerals")
      expect(exhibit.cost).to eq(0)
    end
  end
end
