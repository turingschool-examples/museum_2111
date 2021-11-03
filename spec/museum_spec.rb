require './lib/exhibit'
require './lib/patron'
require './lib/museum'

describe Museum do
  it 'exists' do
    museum = Museum.new()

    expect(museum).to be_a Museum

  end
end
