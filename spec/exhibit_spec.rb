require './lib/patron.rb'
require './lib/exhibit.rb'
require './lib/museum.rb'
require 'pry'

RSpec.describe Exhibit do

  it 'exists' do
    exhibit = Exhibit.new
    expect(exhibit).to be_instance_of Exhibit
  end

  it 'has a name and a cost' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    expect(exhibit.name).to eq "Gems and Minerals"
    expect(exhibit.cost).to be 0
  end

end
