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

  describe "#capital_coordinates" do
    it "returns capital city coordinates" do
      service = RestCountriesService.new
      country = service.random_country
      capital = country[:capital]

      expect(country).to be_a(Hash)
      expect(country).to have_key(:capital)
      
      coordinates = service.capital_coordinates(capital)

      expect(coordinates).to be_a(Hash)
      expect(coordinates).to have_key(:lat)
      expect(coordinates).to have_key(:lng)
      expect(coordinates[:lat]).to be_a(Float)
      expect(coordinates[:lng]).to be_a(Float)
    end
  end
end