RSpec.describe Exhibit do
  it 'exists' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0}))
    # binding.pry
    expect(exhibit).to be_a(Exhibit)
  end

  it 'has a name' do
    exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0}))
    # binding.pry
    expect(exhibit.name).to be_a("Gems and Minerals")
  end
end
