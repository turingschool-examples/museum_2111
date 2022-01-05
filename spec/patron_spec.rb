# require './lib/exhibit'
require './lib/patron'
require 'rspec'


RSpec.describe Patron do

   let(:patron_1) {Patron.new("Bob", 20)}

  context 'iteration I' do

    it 'exists' do

      expect(patron_1).to be_a Patron
    end

    # xit 'can access attributes'
    #
    #   expect(patron_1.name).to eq("Bob")
    #   expect(patron_1.spending_money). to eq(20)
    # end

    it 'can #add_interests' do

      expect(patron_1.interests).to eq([])
      patron_1.add_interest("Dead Sea Scrolls")
      expect(patron_1.interests).to eq(["Dead Sea Scrolls"])
    end
end
end
