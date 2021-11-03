require './lib/exhibit'
require './lib/patron'
require './lib/museum'

describe Museum do
  it 'exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns).to be_a Museum
    expect(dmns.name).to eq ("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq ([])

  end

  it 'shows it can add exhitbits' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    expect(dmns.exhibits.count).to eq 3
  end
end
