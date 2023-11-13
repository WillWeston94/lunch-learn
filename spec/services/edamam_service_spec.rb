require "rails_helper"

RSpec.describe EdamamService, :vcr do
  let (:service) { EdamamService.new }

  describe "#get_recipes_by_country" do
    it "returns a successful json response" do
      query = "Deutschland"
      response = service.get_recipes_by_country(query)
      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(response_body).to be_a(Hash)
    end
  end
end