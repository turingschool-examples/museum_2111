RSpec.describe Card do
  describe "exists" do
    it "patron exists" do
      patron_1 = Patron.new("Bob", 20)

      expect(patron_1).to be_a(Patron)
      expect(patron_1.name).to eq("Bob")
      expect(patron_1.spending_money).to eq(20)
      expect(patron_1.interests).to eq([])
    end

    it "shows patrons interests" do
  end
end
