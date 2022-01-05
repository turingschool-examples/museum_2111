require 'RSpec'
require './lib/museum'
require 'pry'

RSpec.describe Patron do

  it 'exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    # binding.pry
    expect(dmns).to be_a(Museum)
  end

  xit 'has a name' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    # binding.pry
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
  end
end
