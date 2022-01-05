require './lib/exhibit'

RSpec.describe Exhibit do
  describe "exists" do
    it "has features" do
      exhibit = Exhibit.new(name: "Gems and Minerals", cost: 3)

      expect(exhibit).to be_a(Exhibit)
      expect(exhibit.name).to eq("Gems and Minerals")
      expect(exhibit.cost).to eq(3)
    end
  end
end
