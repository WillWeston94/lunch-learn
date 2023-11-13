require "rails_helper"

RSpec.describe TouristSite do
  describe "initialize" do
    it "exists with attributes" do
      site = TouristSite.new({name: "Eiffel Tower", formatted: "Paris, France", place_id: "ChIJIQBpAG2ahYAR_6128GcTUEo"})

      expect(site).to be_a(TouristSite)

      expect(site.name).to eq("Eiffel Tower")
      expect(site.formatted).to eq("Paris, France")
      expect(site.place_id).to eq("ChIJIQBpAG2ahYAR_6128GcTUEo")
    end
  end
end