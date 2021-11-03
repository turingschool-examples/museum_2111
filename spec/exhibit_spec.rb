require './lib/exhibit'

describe Exhibit do
  it 'exists' do
    exhibit = Exhibit.new
    expect(exhibit).to be_instance_of(Exhibit)
  end
end 
