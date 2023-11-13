class Country
  attr_reader :id, :name, :official

  def initialize(country_data)
    @name = country_data[:name][:common]
    @official = country_data[:name][:official]
  end
end