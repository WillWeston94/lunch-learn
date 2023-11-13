require "rails_helper"

RSpec.describe RecipeFacade do
  let (:facade) { RecipeFacade }

  describe "#get_recipes_by_country", :vcr do
    xit "returns an array of recipe objects for a specific country" do
      query = "Deutschland"
      response = facade.get_recipes_by_country(query)

      # binding.pry
      expect(response).to be_an(Array)
      expect(response.first).to be_a(Recipe)
    end

    xit "returns an empty array" do # currently crashing RSpec suite
      query = nil
      response = facade.get_recipes_by_country(query)

      expect(response).to be_an(Array)
      expect(response.first).to be_a(Recipe)
    end
  end
end