require "./lib/patron"

RSpec.describe Patron do
  it 'exists' do

    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_instance_of(Patron)
  end
end
