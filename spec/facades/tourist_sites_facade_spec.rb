require "rails_helper"

RSpec.describe TouristSitesFacade do
  describe "#get_tourist_sites", :vcr do
    it "returns tourist site objects for a specific country" do
      country = "France"
      facade = TouristSitesFacade.new
      response = facade.get_tourist_sites(country)

      expect(response).to be_an(Array)
      expect(response.first).to be_a(TouristSite)
    end
  end
end
