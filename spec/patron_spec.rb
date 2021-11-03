require './lib/patron'

RSpec.describe Patron do
  it 'exists' do
    patron = Patron.new("Bob", 20)
  end
end
