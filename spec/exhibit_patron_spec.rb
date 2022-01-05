require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do
  subject { Exhibit.new({name: "Gems and Minerals", cost: 0}) }
  context "iteration-1" do
    it "exists" do
    expect(subject.name).to eq("Gems and Minerals")
    expect(subject.cost).to eq(0)
  end
end
