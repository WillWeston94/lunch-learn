class TouristSitesFacade
  def get_tourist_sites(country)
    countries_facade = CountriesFacade.new
    capital_coordinates = countries_facade.capital_coordinates(country)
    return [] if capital_coordinates.nil?
    # binding.pry
    places_service = PlacesService.new

    site_data = places_service.get_tourist_sites(capital_coordinates[:lon], capital_coordinates[:lat])
    # binding.pry

    sites = site_data[:features].map do |site|
      attributes = site[:properties].slice(:name, :formatted, :place_id)
      TouristSite.new(attributes)
    end
    sites
  end
end