require './lib/patron'

describe Patron do
  it 'exists' do
    patron = Patron.new("Bob", 20)

    expect(patron).to be_a Patron
    expect(patron.name).to eq ("Bob")
    expect(patron.spending_money).to eq 20
    expect(patron.interests).to eq ([])
  end
end
