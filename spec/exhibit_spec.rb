require './lib/exhibit'

RSpec.describe do
  let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}

  it "exists" do
    expect(exhibit).to be_a Exhibit
  end

  it 'has a name' do
    expect(exhibit.name).to eq "Gems and Minerals"
  end
end
