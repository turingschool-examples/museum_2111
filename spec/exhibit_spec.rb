require './lib/exhibit'
require 'rspec'
require 'pry'
RSpec.describe Exhibit do

  let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}

  context 'iteration I' do

    it 'exists' do
      expect(exhibit).to be_a Exhibit
    end

    it "has attributes" do

      expect(exhibit.name).to eq("Gems and Minerals")
      expect(exhibit.cost).to eq(0)
    end


  end
end
