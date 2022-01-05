require './lib/exhibit'
require './lib/patron'
require 'pry'

RSpec.describe 'exhibit' do

  before(:each) do
    @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    # binding.pry
  end

  it "exists" do
    expect(@exhibit).to be_a(Exhibit)
  end

  

end
