class CountriesFacade

  def self.random_country
    countries = RestCountriesService.new
    country = countries.random_country
    Country.new(country)
  end
end
