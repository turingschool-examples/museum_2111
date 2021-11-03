require './lib/exhibit'
require './lib/patron'
require './lib/museum'

describe Museum do
  it 'exists' do
    museum = Museum.new("Denver Museum of Nature and Science")

    expect(museum).to be_a Museum
    expect(museum.name).to eq ("Denver Museum of Nature and Science")
    expect(museum.exhibits).to eq ([])

  end
end
