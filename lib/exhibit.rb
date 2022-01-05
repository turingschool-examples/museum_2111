class Exhibit
  attr_reader :name, :cost
  def initialize(args)
    args.each do |name, cost|
      instance_variable_set("@#{name}", cost)
    end
  end
end
