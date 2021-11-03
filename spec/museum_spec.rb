require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
  it 'exists' do
    dmns = Museum.new('Denver Museum of Nature and Science')
    expect(dmns).to be_an_instance_of(Museum)
  end

  it 'has a name' do
    dmns = Museum.new('Denver Museum of Nature and Science')
    expect(dmns.name).to eq('Denver Museum of Nature and Science')
  end

  it 'has a exhibits' do
    dmns = Museum.new('Denver Museum of Nature and Science')
    expect(dmns.exhibits).to eq([])
  end

  it 'has new exhibits' do
    gems_and_minerals = Exhibit.new({ name: 'Gems and Minerals', cost: 0 })
    dead_sea_scrolls = Exhibit.new({ name: 'Dead Sea Scrolls', cost: 10 })
    imax = Exhibit.new({ name: 'IMAX', cost: 15 })
    expect(gems_and_minerals).to be_an_instance_of(Exhibit)
    expect(dead_sea_scrolls).to be_an_instance_of(Exhibit)
    expect(imax).to be_an_instance_of(Exhibit)
  end
end
