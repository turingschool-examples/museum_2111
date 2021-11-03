require './lib/exhibit'

RSpec.describe Exhibit do
  context 'Iterattion I' do
    let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}

    describe 'an Exhibit' do
      it 'exists' do

        expect(exhibit).to be_a(Exhibit)
      end

      it 'has attributes' do

        expect(exhibit.name).to eq("Gems and Minerals")
        expect(exhibit.cost).to eq(0)
      end 
    end
  end
end
