require "rails_helper"

RSpec.describe PlacesService, :vcr do
  let (:service) { PlacesService.new }

  describe "#get_tourist_sites" do
    it "returns tourist site for paris france radius" do
      response = service.get_tourist_sites(2.344, 48.86) #paris formatted: "Rue des Prouvaires, 75001 Paris, France"

      expect(response).to be_a(Hash)
      expect(response).to have_key(:features)
      expect(response[:features]).to be_an(Array)
      expect(response[:features].first).to have_key(:properties)
    end
  end
end