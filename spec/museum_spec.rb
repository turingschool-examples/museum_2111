require './lib/patron'
require './lib/exhibit'
require './lib/museum'

RSpec.describe Museum do
  let(:gems_and_minerals) { Exhibit.new({name: 'Gems and Minerals', cost: 0}) }
  let(:dead_sea_scrolls) { Exhibit.new({name: 'Dead Sea Scrolls', cost: 10}) }
  let(:imax) { Exhibit.new({name: 'IMAX', cost: 15}) }
  let(:patron_1) { Patron.new('Bob', 20) }
  let(:patron_2) { Patron.new('Sally', 20) }
  let(:dmns) { Museum.new('Denver Museum of Nature and Science') }

  describe '#initialize' do
    it 'exists' do
      expect(dmns).to be_a(Museum)
    end

    it 'has a name' do
      expect(dmns.name).to eq('Denver Museum of Nature and Science')
    end

    it 'has no exhibits initially' do
      expect(dmns.exhibits).to eq([])
    end
  end

  describe '#add_exhibit' do
    it 'can add Exhibit to the exhibits array' do
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      
      expected = [gems_and_minerals, dead_sea_scrolls, imax]
      expect(dmns.exhibits).to eq(expected)
    end
  end
  
  describe '#recommend_exhibits' do
    it 'can recommend exhibits based on patrons interests' do
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      patron_1.add_interest('Dead Sea Scrolls')
      patron_1.add_interest('Gems and Minerals')
      patron_2.add_interest('IMAX')

      expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
      expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
    end
  end
end