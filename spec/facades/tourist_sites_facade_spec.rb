require "rails_helper"

RSpec.describe TouristSitesFacade do
  describe "#get_tourist_sites", :vcr do
   it "returns an array of tourist site objects for a specific country" do
      country = CountriesFacade.random_country
      sites = TouristSitesFacade.get_tourist_sites('France')

      expect(sites).to be_an(Array)
      expect(sites).to_not be_empty
      sites.each do |site|
        expect(site).to include(
          id: nil,
          type: "tourist_site",
          attributes: {
            name: a_kind_of(String),
            address: a_kind_of(String),
            place_id: a_kind_of(String)
          }
        )
      end
    end
  end
end
