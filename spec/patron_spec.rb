RSpec.describe Patron do

  it 'exists' do
    patron_1 = Patron.new("Bob", 20)
    # binding.pry
    expect(patron_1).to be_a(Patron)
  end

  it 'has a name' do
    patron_1 = Patron.new("Bob", 20)
    # binding.pry
    expect(patron_1.name).to be_a("Bob")
  end
end
