require './lib/exhibit'
require 'pry'

RSpec.describe Patron do
  before(:each) do
    @patron_1 = Patron.new('Bob', 20)
  end

end
