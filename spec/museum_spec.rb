require './lib/patron'
require './lib/exhibit'
require './lib/museum'

describe Museum do
  before(:each) do
    @museum = Museum.new("Denver Museum of Nature and Science")
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")
    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("IMAX")
    @patron_3 = Patron.new("Johnny", 5)
    @patron_3.add_interest("Dead Sea Scrolls")
  end
  describe 'initialize' do
    it 'exists' do
      expect(@museum).to be_a(Museum)
    end

    it 'has_attributes' do
      expect(@museum.name).to eq("Denver Museum of Nature and Science")
      expect(@museum.exhibits).to eq([])
      expect(@museum.patrons).to eq([])
    end
  end

  describe ' methods' do
    describe ' #add_exhibit' do
      it 'adds new exhibit to exhibits' do
        expect(@museum.exhibits).to eq([])
        @museum.add_exhibit(@gems_and_minerals)
        expect(@museum.exhibits).to eq([@gems_and_minerals])
        @museum.add_exhibit(@dead_sea_scrolls)
        expect(@museum.exhibits).to eq([@dead_sea_scrolls, @gems_and_minerals])
        @museum.add_exhibit(@imax)
        expect(@museum.exhibits).to eq([@dead_sea_scrolls, @gems_and_minerals, @imax])
      end
    end
    describe ' #recommend_exhibits' do
      it 'returns an array of exhibits that the patron has interest in' do
        @museum.add_exhibit(@gems_and_minerals)
        @museum.add_exhibit(@dead_sea_scrolls)
        @museum.add_exhibit(@imax)
        expect(@museum.recommend_exhibits(@patron_1)).to eq([@dead_sea_scrolls, @gems_and_minerals])
        expect(@museum.recommend_exhibits(@patron_2)).to eq([@imax])
      end
    end

    describe ' #admit' do
      it 'adds a patron to the patrons list alphabetically' do
        expect(@museum.patrons).to eq([])
        @museum.admit(@patron_1)
        expect(@museum.patrons).to eq([@patron_1])
        @museum.admit(@patron_2)
        expect(@museum.patrons).to eq([@patron_1, @patron_2])
        @museum.admit(@patron_3)
        expect(@museum.patrons).to eq([@patron_1, @patron_3, @patron_2])
      end
    end

    describe ' #patrons_by_exhibit_interest' do
      before(:each) do
        @patron_1 = Patron.new("Bob", 20)
        @patron_1.add_interest("Dead Sea Scrolls")
        @patron_1.add_interest("Gems and Minerals")
        @patron_2 = Patron.new("Sally", 20)
        @patron_2.add_interest("Dead Sea Scrolls")
        @patron_3 = Patron.new("Johnny", 5)
        @patron_3.add_interest("Dead Sea Scrolls")
        @museum.add_exhibit(@gems_and_minerals)
        @museum.add_exhibit(@dead_sea_scrolls)
        @museum.add_exhibit(@imax)
        @museum.admit(@patron_1)
        @museum.admit(@patron_2)
        @museum.admit(@patron_3)
      end
      it 'returns a hash where each key is an exhibit' do
        expect(@museum.patrons_by_exhibit_interest).to be_a(Hash)
        expect(@museum.patrons_by_exhibit_interest.keys.all?{|key| key.class == Exhibit}).to eq(true)
      end
      it 'returns an array of values for each key' do
        expect(@museum.patrons_by_exhibit_interest.values.all?{|value| value.class == Array}).to eq(true)
      end
      it 'returns the correct array of Patrons for each key' do
        expect(@museum.patrons_by_exhibit_interest).to eq({@dead_sea_scrolls => [@patron_1, @patron_3, @patron_2], @gems_and_minerals => [@patron_1], @imax => [] })
      end
    end

    describe 'lottery methods' do
      before(:each) do
        @patron_1 = Patron.new("Bob", 0)
        @patron_1.add_interest("Dead Sea Scrolls")
        @patron_1.add_interest("Gems and Minerals")
        @patron_2 = Patron.new("Sally", 20)
        @patron_2.add_interest("Dead Sea Scrolls")
        @patron_3 = Patron.new("Johnny", 5)
        @patron_3.add_interest("Dead Sea Scrolls")
        @museum.add_exhibit(@gems_and_minerals)
        @museum.add_exhibit(@dead_sea_scrolls)
        @museum.add_exhibit(@imax)
        @museum.admit(@patron_1)
        @museum.admit(@patron_2)
        @museum.admit(@patron_3)
      end
      describe ' #ticket_lottery_contestants' do
        it 'returns nil if no Patrons are eligible' do
          expect(@museum.ticket_lottery_contestants(@dead_sea_scrolls)).to eq(nil)
        end
        it 'returns an array of Patrons' do
          expect(@museum.ticket_lottery_contestants(@gems_and_minerals)).to be_a(Array)
        end
        it 'returns an array of Patrons if some patrons are eligible' do
          expect(@museum.ticket_lottery_contestants(@imax).all?{|value| value.class == Patron}).to eq(true)
        end
        it 'returns the correct array of Patrons' do
          expect(@museum.ticket_lottery_contestants(@gems_and_minerals)).to eq([@patron_1, @patron_3])
          expect(@museum.ticket_lottery_contestants(@imax)).to eq([@patron_1, @patron_3])
        end
      end
    end
  end
end
