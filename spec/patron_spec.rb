require './lib/patron'
RSpec.describe do Patron
  it 'exists' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1).to be_a(Patron)
  end

  it 'has a name' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.name).to eq('Bob')
  end

  it '' do
  end

  it '' do
  end

  it '' do
  end

  it '' do
  end

  it '' do
  end

  it '' do
  end
end
