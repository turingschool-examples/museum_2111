require './lib/patron'

RSpec.describe Patron do
  before :each do
    @patron_1 = Patron.new("Bob", 20)
  end

  it "exists" do
    expect(@patron_1).to be_an_instance_of(Patron)
  end

  it "checks the attributes" do
    expect(@patron_1.name).to be_an_instance_of("Bob")
    expect(@patron_1.spending_money).to be_an_instance_of(20)
    expect(@patron_1.interests).to be_an_instance_of([])
  end
end
