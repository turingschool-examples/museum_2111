require './lib/patron'
require './lib/exhibit'
require 'rspec'
require 'pry'

RSpec.describe Museum do

  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}

  context 'iteration II' do

    it "exists" do
      expect(exhibit).to be_a Exhibit
    end
  end
end
