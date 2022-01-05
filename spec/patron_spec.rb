require './lib/exhibit'
require './lib/patron'

RSpec.describe do
  let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:patron_1)  {Patron.new("Bob", 20)}

  it "exists" do
    expect(patron_1).to be_a Patron
  end

  it "has a name" do
    expect(patron_1.name).to eq("Bob")
  end

  it "can have interests" do
    expect(patron_1.interests).to eq([])
  end
end
