require 'rspec'
require './lib/patron'
require './lib/exhibit'

describe Exhibit do 
    let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
    let(:patron_1) {Patron.new("Bob", 20)}

    it 'exists' do
        expect(exhibit).to be_an_instance_of(Exhibit)
    end

    it 'attributes' do
        expect(exhibit.name).to eq("Gems and Minerals")
        expect(exhibit.cost).to eq(0)
    end
end