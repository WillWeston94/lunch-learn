class TouristSitesFacade
  def self.get_tourist_sites(country)
    capital_coordinates = RestCountriesService.get_capital_coordinates(country)
    return [] if capital_coordinates.nil?

    site_data = PlacesService.get_tourist_sites(coordinates[:lon], coordinates[:lat])
    site_data[:features].map do |site|
      {
        id: nil,
        type: "tourist_site",
        attributes: {
          name: site[:properties][:name],
          formatted: site[:properties][:formatted],
          place_id: site[:properties][:place_id]
        }
      }
    end
  end
end