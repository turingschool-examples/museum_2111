require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do

  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}

  let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}

  let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}

  let(:imax) {Exhibit.new({name: "IMAX",cost: 15})}

  let(:patron_1) {Patron.new("Bob", 20)}

  let(:patron_2) {Patron.new("Sally", 20)}

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

  describe '#recommend_exhibit' do
    it 'creates array of exhibits that match patrons interests' do
      dmns.add_exhibit(gems_and_minerals)

      dmns.add_exhibit(dead_sea_scrolls)

      dmns.add_exhibit(imax)

      patron_1.add_interest("Dead Sea Scrolls")

      patron_1.add_interest("Gems and Minerals")

      patron_2.add_interest("IMAX")

      expect(dmns.recommend_exhibit(patron_1)).to eq([dead_sea_scrolls.name, gems_and_minerals.name])

      expect(dmns.recommend_exhibit(patron_2)).to eq([imax.name])
    end
  end

  describe '#patrons_by_exhibit_interests' do
    it 'returns a hash' do
      expect(dmns.patrons_by_exhibit_interests).to be_an_instance_of(Hash)
    end

    it 'sets exhibits to keys' do
      expect(dmns.patrons_by_exhibit_interests.keys).to eq([])
    end

    it 'sets patrons with interest in exhibit as value' do
      expect(dmns.patrons_by_exhibit_interests.value).to eq([])
    end

  end
end
