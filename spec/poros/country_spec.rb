require "rails_helper"

RSpec.describe Country do
  describe "initialize" do
    it "exists with attributes" do
      country = Country.new({name: "France"})

      expect(country).to be_a(Country)

      expect(country.name).to eq("France")
    end
  end
end