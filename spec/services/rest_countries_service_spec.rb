require "rails_helper"

RSpec.describe RestCountriesService, :vcr do
  let (:service) { RestCountriesService.new }

  # This is random, due to some being name others being common and some having nativeName I need to fix"
  describe "#random_country" do
    it "returns a successful json response" do
      service = RestCountriesService.new
      country = service.random_country

      expect(country).to be_a(Hash)
      expect(country).to have_key(:name)
      expect(country[:name]).to have_key(:common)
      expect(country[:name]).to have_key(:official)
      expect(country[:name][:common]).to be_a(String)
      expect(country[:name][:official]).to be_a(String)
    end
  end
end