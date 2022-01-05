require './lib/patron'
require 'pry'

RSpec.describe Patron do
  before(:each) do
    @patron_1 = Patron.new('Bob', 20)
  end
  it 'will create an instance of patron' do
    expect(@patron_1).to be_instance_of(Patron)
  end

end
