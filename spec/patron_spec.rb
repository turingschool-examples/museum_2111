# require './lib/exhibit'
require './lib/patron'

RSpec.describe Patron do


let(:patron_1) {Patron.new("Charlie", 20)}

  context 'iteration I' do
    it 'exists' do

      expect(parton_1).to be_instance_of(Patron)
    end
  end
end
