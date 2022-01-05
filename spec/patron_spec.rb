require "./lib/patron"

RSpec.describe Patron do
  it 'exists' do

    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_instance_of(Patron)
  end

  it 'has name' do

    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.name).to eq("Bob")
  end

  it 'has money' do

    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.spending_money).to eq(20)
  end

  it 'has interests' do

    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.interests).to be_instance_of(Array)
  end
end
