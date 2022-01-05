require 'pry'
class Exhibit
  attr_reader :attrhash

  def initialize(attrhash)
    @attrhash = attrhash
  end

  def name
    @attrhash[:name]
  end
end
