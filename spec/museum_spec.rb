require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
  it 'exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns).to be_instance_of(Museum)
  end

  it 'museums have a name' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns.name).to eq("Denver Museum of Nature and Science")
  end

  it 'starts w empty exhibit array' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns.exhibits).to eq([])
  end
end
