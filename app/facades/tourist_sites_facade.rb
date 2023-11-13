class TouristSitesFacade
  def self.get_tourist_sites(country)
    capital_coordinates = RestCountriesService.get_capital_coordinates(country)
    return [] if capital_coordinates.nil?

    lat, lng = capital_coordinates.values_at(:lat, :lng)
    tourist_sites = PlacesService.get_tourist_sites(lat, lng)
    tourist_sites.map do |site|
      {
        id: nil,
        type: "tourist_site",
        attributes: {
          name: site[:name],
          address: site[:formatted_address],
          place_id: site[:place_id]
      } }
    end
  end
end