require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do

  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}

  let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}

  let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}

  let(:imax) {Exhibit.new({name: "IMAX",cost: 15})}

  describe '#initialize' do
    it 'exists' do
      expect(dmns).to be_an_instance_of(Museum)
    end

    it 'has a name' do
      expect(dmns.name).to eq("Denver Museum of Nature and Science")
    end

    it 'has exhibits' do
      expect(dmns.exhibits).to eq([])
    end
  end

  describe '#add_exhibit' do
    it 'puts exhibit in exhibits array' do
      dmns.add_exhibit(gems_and_minerals)

      dmns.add_exhibit(dead_sea_scrolls)

      dmns.add_exhibit(imax)

      expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
    end
  end


end
