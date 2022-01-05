require 'pry'
require './lib/exhibit.rb'
require 'rspec'

describe Exhibit do

    # @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  describe '#iteration 1' do
    it 'creates an instance' do
      @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

      expect(@exhibit).to be_an_instance_of(Exhibit)
    end

    it 'can have a name' do

      expect(exhibit.name).to eq("Gems and Minerals")
    end
  end
end
