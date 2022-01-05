require './lib/patron'
require './lib/exhibit'
require './lib/museum'
require 'rspec'
require 'pry'

RSpec.describe Museum do

  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}

  context 'iteration II' do

    it "exists" do
      expect(dmns).to be_an_instance_of Museum
    end
  end
end
