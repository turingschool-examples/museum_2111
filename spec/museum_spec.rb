require './lib/patron'
require './lib/exhibit'
require './lib/museum'

describe Exhibit do
  before(:each) do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @patron_1 = Patron.new("Bob", 20)
    dmns = Museum.new("Denver Museum of Nature and Science")
  end

  
end
