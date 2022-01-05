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

  it 'has spending money' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.spending_money).to be(20)
  end

  it 'has interests' do
    patron_1 = Patron.new("Bob", 20)

    expect(patron_1.ineterests).to eq([])
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
