class CountriesFacade
  def self.get_countries
    RestCountriesService.new.get_countries.map do |country_data|
      Country.new(country_data)
    end
  end
end