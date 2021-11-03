require 'rspec'
require './lib/museum'

describe Museum do 
    let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
    let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}  
    let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}  
    let(:imax) {Exhibit.new({name: "IMAX", cost: 15})}  
    let(:patron_1) {Patron.new("Bob", 20)}
    let(:patron_2) {Patron.new("Sally", 20)}

    it 'exists' do
        expect(dmns).to be_an_instance_of(Museum)
    end

    it 'attributes' do
        expect(dmns.name).to eq("Denver Museum of Nature and Science")
        expect(dmns.exhibits).to eq([])
        expect(dmns.patrons).to eq([])
    end

    context 'builds museum' do 
        before(:each) do 
            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)
            patron_1.add_interest("Dead Sea Scrolls")
            patron_1.add_interest("Gems and Minerals")
            patron_2.add_interest("IMAX")
        end

        it 'can add exhibits' do 
            expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
        end

        it 'can reccomend exhibits' do 
            expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
            expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
        end
    end

    describe 'iteration 3' do 
        let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
        let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}  
        let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}  
        let(:imax) {Exhibit.new({name: "IMAX", cost: 15})}
        let(:patron_1) {Patron.new("Bob", 0)}
        let(:patron_2) {Patron.new("Sally", 20)}
        let(:patron_3) {Patron.new("Johnny", 5)}

        before(:each) do 
            dmns.add_exhibit(gems_and_minerals)
            dmns.add_exhibit(dead_sea_scrolls)
            dmns.add_exhibit(imax)
            patron_1.add_interest("Gems and Minerals")
            patron_1.add_interest("Dead Sea Scrolls")
            patron_2.add_interest("Dead Sea Scrolls")
            patron_3.add_interest("Dead Sea Scrolls")
            dmns.admit(patron_1)
            dmns.admit(patron_2)
            dmns.admit(patron_3)
        end 

        it 'can add patrons' do 
            expect(dmns.patrons).to eq([patron_1, patron_2, patron_3])
        end

        it '#patrons_by_exhibit_interest' do 
            expected = {
            gems_and_minerals => [patron_1],
            dead_sea_scrolls => [patron_1, patron_2, patron_3],
            imax => []
            }
            expect(dmns.patrons_by_exhibit_interest).to eq(expected)
        end

        it '#ticket_lottery_contestants' do 
            expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq([patron_1, patron_3])
        end

        it '#draw_lottery_winner' do 
            allow(dmns.draw_lottery_winner).to receive(:ticket_lottery_contestants(dead_sea_scrolls)).and_return(patron_1)
            expect(dmns.draw_lottery_winner).to eq(patron_1 || patron2 )
        end
    end
end