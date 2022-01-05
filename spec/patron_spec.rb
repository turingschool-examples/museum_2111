require './lib/exhibit'
require './lib/patron'
require 'pry'

RSpec.describe Patron do
  let(:patron_1) {Patron.new("Bob", 20)}

  it 'exists' do
    expect(patron_1).to be_a(Patron)
  end

  it '#add_interest receives elements' do
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")
    expect(patron_1).to eq(["Gems and Minerals", "Dead Sea Scrolls"])
  end
end
