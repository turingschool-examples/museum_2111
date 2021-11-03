require './lib/exhibit'
require './lib/patron'

describe Patron do
  it 'exists' do
    patron = Patron.new
    expect(patron).to be_instance_of(Patron)
  end
end 
