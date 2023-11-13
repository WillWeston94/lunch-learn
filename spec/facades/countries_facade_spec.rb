require "rails_helper"

RSpec.describe CountriesFacade do
  describe "#random_country", :vcr do
    it "returns a random country object" do
      country = CountriesFacade.random_country
      
      expect(country).to be_a(Country)
    end
  end

  describe "#capital_coordinates", :vcr do
    it "returns coordinates for a given capital city" do
      facade = CountriesFacade.new
      response = facade.capital_coordinates("France")

      expect(response).to be_a(Hash)
      expect(response[:lat]).to be_a(Float)
      expect(response[:lon]).to be_a(Float)
    end
  end
end