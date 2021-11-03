require './lib/museum'

RSpec.describe Museum do
  before(:each) do
    @museum = Museum.new("Denver Museum of Nature and Science")
  end

  it 'exists' do
    expect(@museum).to be_instance_of(Museum)
  end

  it 'can read museum name' do
    expect(@museum.museum_name).to eq("Denver Museum of Nature and Science")
  end

  it 'can initialize empty exhibits array' do
    expect(@museum.exhibits).to eq([])
  end

end
