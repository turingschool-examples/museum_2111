require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do
  it "exists" do
    patron_1 = Patron.new("Bob", 20)
    expect(patron_1).to be_instance_of(Patron)
  end

  it "has a name" do
    patron_1 = Patron.new("Bob", 20)
    patron_1.name
    expect(patron_1.name).to eq("Bob")
  end

  it "spends money" do
    patron_1 = Patron.new("Bob", 20)
    patron_1.spending_money
    expect(patron_1.spending_money).to eq(20)
  end

  it "has no interests at first" do
    patron_1 = Patron.new("Bob", 20)
    patron_1.interests
    expect(patron_1.interests).to eq([])
  end

  it "can add interests" do
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    patron_1.interests
    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end

end
