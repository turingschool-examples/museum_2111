require './lib/patron'

RSpec.describe Patron do
  describe "exists" do
    it "patron exists" do
      patron_1 = Patron.new("Bob", 20)

      expect(patron_1).to be_a(Patron)
      expect(patron_1.name).to eq("Bob")
      expect(patron_1.spending_money).to eq(20)
      expect(patron_1.interests).to eq([])
    end

    it "shows patrons interests" do
      patron_1 = Patron.new("Bob", 20)

      patron_1.add_interest("Dead Sea Scrolls")
      patron_1.add_interest("Gems and Minerals")

      expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end
  end
end
