# require './lib/exhibit'
require './lib/patron'
require 'rspec'


RSpec.describe Patron do

  let(:patron_1) {Patron.new("Charlie", 20)}

  context 'iteration I' do
    it 'exists' do

      expect(patron_1).to be_a Patron
    end

    it 'can access attributes'

      expect(patron_1.name).to eq("Charlie")
      expect(patron.spending_money). to eq(20)
    end

end
