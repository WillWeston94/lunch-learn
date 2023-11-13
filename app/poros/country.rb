class Country
  attr_reader :common, :official

  def initialize(data)
    @common = data[:name][:common]
    @official = data[:name][:official]
  end
end