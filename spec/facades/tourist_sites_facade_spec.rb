require "rails_helper"

RSpec.describe TouristSitesFacade do
  describe "#get_tourist_sites", :vcr do
    it "returns an array of tourist site objects for a specific country" do
      country = "France"

      tourist_site = TouristSitesFacade.new
      sites = tourist_site.get_tourist_sites(country)

      expect(sites).to be_an(Array)
      sites.each do |site|
        expect(site).to include(
          id: nil,
          type: "tourist_site",
          attributes: {
            name: a_kind_of(String),
            formatted: a_kind_of(String),
            place_id: a_kind_of(String)
          }
        )
        end
    end
  end
end
