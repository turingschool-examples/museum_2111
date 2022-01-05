require './lib/patron'
require 'pry'

RSpec.describe Patron do
  before(:each) do
    @patron_1 = Patron.new('Bob', 20)
  end
  it 'will create an instance of patron' do
    expect(@patron_1).to be_instance_of(Patron)
  end
  it 'will recognize name attribute' do
    expect(@patron_1.name).to eq('Bob')
  end
  it "will recognize patron's spending money" do
    expect(@patron_1.spending_money).to eq(20)
  end
  describe "Interests" do
    it 'will initially have no interests' do
      expect(@patron_1.interests).to eq([])
    end
    it 'can add interests with method' do
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      expect(@patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end
  end 


end
