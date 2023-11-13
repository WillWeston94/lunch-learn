require "rails_helper"

RSpec.describe CountriesFacade do
  describe "#random_country", :vcr do
  it "returns a random country object" do
    country = CountriesFacade.random_country
      
    expect(country).to be_a(Country)
    end
  end
end