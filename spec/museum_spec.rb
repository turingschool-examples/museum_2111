require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  subject { Museum.new("Denver Museum of Nature and Science") }
  before(:each) do
    @patron_1 = Patron.new("Bob", 20)
    @patron_2 = Patron.new("Sally", 20)
    @patron_3 = Patron.new("Johnny", 5)
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})
  end
  context "iteration-2" do
    it "exists" do
      expect(subject.name).to eq("Denver Museum of Nature and Science")
      expect(subject.exhibits).to eq([])
    end

    it "can #add_exhibits" do
      subject.add_exhibit(@gems_and_minerals)
      subject.add_exhibit(@dead_sea_scrolls)
      subject.add_exhibit(@imax)
      expect(subject.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end

    it "#recommend_exhibits based on patron interests" do
      subject.add_exhibit(@gems_and_minerals)
      subject.add_exhibit(@dead_sea_scrolls)
      subject.add_exhibit(@imax)
      @patron_1.add_interest("Dead Sea Scrolls")
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("IMAX")
      expect(subject.recommend_exhibits(@patron_1)).to eq([@gems_and_minerals, @dead_sea_scrolls])
      expect(subject.recommend_exhibits(@patron_2)).to eq([@imax])
    end
  end

  context "iteration-2" do
    it "#admits patrons" do
      expect(subject.patrons).to eq([])
      subject.admit(@patron_1)
      subject.admit(@patron_2)
      subject.admit(@patron_3)
      expect(subject.patrons).to eq([@patron_1,@patron_2,@patron_3])
    end

    it "displays #patrons_by_exhitbit" do
      subject.add_exhibit(@gems_and_minerals)
      subject.add_exhibit(@dead_sea_scrolls)
      subject.add_exhibit(@imax)
      subject.admit(@patron_1)
      subject.admit(@patron_2)
      subject.admit(@patron_3)
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")
      hash = { @gems_and_minerals => [@patron_1],
              @dead_sea_scrolls => [@patron_2],
              @imax => [@patron_3] }
      expect(subject.patrons_by_exhibit_interest).to eq(hash)
    end

    it "has #ticket_lottery_contestants" do
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")
      expect(subject.ticket_lottery_contestants(dead_sea_scrolls)).to eq([@patron_2,@patron_3])
    end

    it "can #draw_lottery_winner" do
      @patron_1.add_interest("Gems and Minerals")
      @patron_2.add_interest("Dead Sea Scrolls")
      @patron_3.add_interest("Dead Sea Scrolls")
      expect(subject.draw_lottery_winner(dead_sea_scrolls)).to eq(@patron_2.name || @patron_3.name)
      expect(subject.draw_lottery_winner(gems_and_minerals)).to eq(nil)
    end
  end
end
