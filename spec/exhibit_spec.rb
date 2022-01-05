require './lib/exhibit'
RSpec.describe do
  it 'exists' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    expect(exhibit).to be_a(Exhibit)
  end

  it 'has a name' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

    expect(exhibit.name).to eq('Gems and Minerals')
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
