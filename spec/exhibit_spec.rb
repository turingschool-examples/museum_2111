require 'pry'
require './lib/exhibit'
require './lib/patron'
require 'rspec'

RSpec.describe Exhibit do
  describe 'iteration 1' do
    it 'creates an instance of exhibit' do
        exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

        expect(exhibit).to be_an_instance_of(Exhibit)
      end

      it 'can have a name' do
        exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})

        expect(exhibit.name).to eq("Gems and Minerals")
      end
    end
  end
