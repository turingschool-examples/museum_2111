require './lib/exhibit'
require './lib/patron'
|require './lib/museum'
require 'pry'
require 'Rspec'


describe Museum do
  describe "this will test the Museum class" do
    it "checks the functionality" do
      dmns = Museum.new("Denver Museum of Nature and Science")
      expect(dmns.name).to eq("Denver Museum of Nature and Science")
      expect(dmns.exhibits).to eq([])
    end
  end
end
