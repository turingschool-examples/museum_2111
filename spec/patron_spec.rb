require './lib/exhibit'
require './lib/patron'
require 'pry'

RSpec.describe Patron do
  let(:patron_1) {Patron.new("Bob", 20)}

  it 'exists' do
    expect(patron_1).to be_a(Patron)
  end
end
