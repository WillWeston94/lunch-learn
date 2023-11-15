require "rails_helper"

RSpec.describe RecipeFacade, :vcr do
  let (:facade) { RecipeFacade }

  describe "#get_recipes_by_country" do
    it "returns an array of recipe objects for a specific country" do
      query = "Deutschland"
      response = facade.get_recipes_by_country(query)
      
      # binding.pry
      expect(response).to be_an(Array)
      expect(response.first).to be_a(Recipe)
      expect(response.first.title).to eq("Mashed Potato with Blackpepper & Mushroom Gravy")

    end

    it "returns an empty array" do # currently crashing RSpec suite
      query = nil
      response = facade.get_recipes_by_country(query)
      # binding.pry
      expect(response).to be_an(Array)
      expect(response).to be_empty
    end
  end
end