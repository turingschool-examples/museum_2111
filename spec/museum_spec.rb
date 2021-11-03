require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  context 'Iterattion II' do
    let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
    let(:dead_sea_scrolls)  {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
    let(:imax)              {Exhibit.new({name: "IMAX",cost: 15})}

    let(:patron_1)          {Patron.new("Bob", 0)}
    let(:patron_2)          {Patron.new("Sally", 20)}
    let(:patron_3)          {Patron.new("Johnny", 5)}

    let(:dmns)              {Museum.new("Denver Museum of Nature and Science")}

    describe 'a Museum' do
      it 'exists' do

        expect(dmns).to be_a(Museum)
      end

      it 'has attributes' do

        expect(dmns.name).to eq('Denver Museum of Nature and Science')
        expect(dmns.exhibits).to eq([])
      end

      it 'can add exhibits' do
        dmns.add_exhibit(gems_and_minerals)
        dmns.add_exhibit(dead_sea_scrolls)
        dmns.add_exhibit(imax)

        expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
      end

      it 'can recommend exhibits to patrons' do
        dmns.add_exhibit(gems_and_minerals)
        dmns.add_exhibit(dead_sea_scrolls)
        dmns.add_exhibit(imax)
        patron_1.add_interest("Dead Sea Scrolls")
        patron_1.add_interest("Gems and Minerals")

        patron_2.add_interest("IMAX")

        expect(dmns.recommend_exhibits(patron_1)).to eq([dead_sea_scrolls, gems_and_minerals])
        expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
      end
    end

    describe 'Iteration III' do
      before :each do
        dmns.add_exhibit(gems_and_minerals)
        dmns.add_exhibit(dead_sea_scrolls)
        dmns.add_exhibit(imax)

        patron_1.add_interest("Gems and Minerals")
        patron_1.add_interest("Dead Sea Scrolls")

        patron_2.add_interest("Dead Sea Scrolls")

        patron_3.add_interest("Dead Sea Scrolls")
      end

      it 'can record patrons' do

        expect(dmns.patrons).to eq([])
      end

      it 'can admit patrons' do
        dmns.admit(patron_1)
        dmns.admit(patron_2)
        dmns.admit(patron_3)

        expect(dmns.patrons).to eq([patron_1, patron_2, patron_3])
      end

      it 'groups patrons by interest in exhibit' do
        dmns.admit(patron_1)
        dmns.admit(patron_2)
        dmns.admit(patron_3)

        expect(dmns.patrons_by_exhibit_interest).to be_a(Hash)
        expect(dmns.patrons_by_exhibit_interest.keys.first).to eq(gems_and_minerals)
        expect(dmns.patrons_by_exhibit_interest.keys).to eq([gems_and_minerals, dead_sea_scrolls, imax])
        expect(dmns.patrons_by_exhibit_interest[gems_and_minerals]).to eq([patron_1])
        expect(dmns.patrons_by_exhibit_interest[dead_sea_scrolls]).to eq([patron_1, patron_2, patron_3])
        expect(dmns.patrons_by_exhibit_interest[imax]).to eq([])
      end

      it 'can eligible patrons for lotto ticket' do
        dmns.admit(patron_1)
        dmns.admit(patron_2)
        dmns.admit(patron_3)

        expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq([patron_1, patron_3])
      end

      it 'can select a winner' do
        dmns.admit(patron_1)
        dmns.admit(patron_2)
        dmns.admit(patron_3)

        # expect(dmns.draw_lottery_winner(dead_sea_scrolls)).to be_a(Patron)
        expect(dmns.draw_lottery_winner(gems_and_minerals)).to eq(nil)
      end
    end
  end
end
