require './lib/exhibit'
require './lib/patron'

RSpec.describe 'Exhibit' do
  let(:exhibit) do
    Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
  end
  it 'creates a exhibit' do
    exhibit = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })

    expect(exhibit).to be_a(Exhibit)
  end
  context '#attributes' do
    it 'has a name' do
      actual = exhibit.name
      expected = 'Gems and Minerals'
      expect(actual).to eq(expected)
    end
    it 'has a cost' do
      actual = exhibit.cost
      expected = 0
      expect(actual).to eq(expected)
    end
  end
end
