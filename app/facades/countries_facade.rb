class CountriesFacade

  def self.random_country
    countries = RestCountriesService.new
    country = countries.random_country
    Country.new(country)
  end

  def capital_coordinates(country)
    response = RestCountriesService.new.capital_coordinates(country)

    if response && response[:capitalInfo] && response[:capitalInfo][:latlng]
      lon, lat = response[:capitalInfo][:latlng]
      { lat: lat, lon: lon }
    else
      nil
    end
  end
end
