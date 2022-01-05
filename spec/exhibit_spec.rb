require './lib/exhibit'
require 'rspec'

RSpec.describe Exhibit do

  let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}

  context 'iteration I' do

    it 'exists' do
      expect(exhibit).to be_a Exhibit
    end
  end
end
