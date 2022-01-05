require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do
  subject { Exhibit.new({name: "Gems and Minerals", cost: 0}) }
  let(:patron_1) { Patron.new("Bob", 20) }
  context "iteration-1" do
    it "exists" do
      expect(subject.name).to eq("Gems and Minerals")
      expect(subject.cost).to eq(0)
    end
  end

  it "has a patron" do
    expect(patron_1.name).to eq("Bob")
    expect(patron_1.spending_money).to eq(20)
    expect(patron_1.interests).to eq([])
  end

  it "patron can add interests" do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
  end
end
