require './lib/exhibit'
require './lib/patron'

RSpec.describe do Exhibit
  it 'exists' do
  xhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  except(exhibit).to be_an_instance_of(Exhibit)
  end

  # xit 'has a name' do
  # xhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  # except(exhibit.name).to be("Gems and Minterals")
  # end
  #
  # xit 'has a cost' do
  # xhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
  # except(exhibit.cost).to be(0)
  # end




end
