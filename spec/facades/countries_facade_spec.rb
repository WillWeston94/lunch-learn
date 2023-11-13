require "rails_helper"

RSpec.describe CountriesFacade do
  describe "#random_country", :vcr do
    it "returns a random country object" do
      country = CountriesFacade.random_country
      
      expect(country).to be_a(Country)
    end
  end

  describe "#capital_coordinates", :vcr do
    it "returns a hash of coordinates for a given capital city" do
      country = CountriesFacade.random_country
      capital = country.capital
      coordinates = CountriesFacade.capital_coordinates(capital)

      expect(coordinates).to be_a(Hash)
      expect(coordinates).to have_key(:lat)
      expect(coordinates).to have_key(:lng)
      expect(coordinates[:lat]).to be_a(Float)
      expect(coordinates[:lng]).to be_a(Float)
    end
  end
end