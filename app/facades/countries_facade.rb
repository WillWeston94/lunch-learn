class CountriesFacade

  def self.random_country
    countries = RestCountriesService.new
    country = countries.random_country
    Country.new(country)
  end

  def capital_coordinates(country)
    response = RestCountriesService.new.capital_coordinates(country)
    # binding.pry
    if response && response[:lat] && response[:lng]
      lat = response[:lat]
      lon = response[:lng]
      { lat: lat, lon: lon }
    else
      nil
    end
  end
end
