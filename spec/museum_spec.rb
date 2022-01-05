require './lib/patron'
require './lib/exhibit'
require './lib/museum'
require 'pry'

RSpec.describe Museum do
  before(:each) do
    @dmns = Museum.new("Denver Museum of Nature and Science")
  end
  it 'will create an instance of Museum' do
    expect(@dmns).to be_instance_of(Museum)
  end 


end
