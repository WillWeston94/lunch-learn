require "rails_helper"

RSpec.describe "Edamam API"do
  describe "GET /api/v1/recipes", :vcr  do
    it "returns a successful json response" do
      get "/api/v1/recipes", params: {country: "Deutschland"}

      expect(response.status).to eq(200)
    end

    it "returns a list of recipes for a specific country" do
      get "/api/v1/recipes", params: {country: "Deutschland"}

      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a(Hash)
      expect(parsed_response[:data]).to be_an(Array)

      recipe = parsed_response[:data].first
      # binding.pry
      expect(recipe).to have_key(:id)
      expect(recipe[:id]).to eq(nil)
      expect(recipe).to have_key(:type)
      expect(recipe[:type]).to be_a(String)
      expect(recipe[:type]).to eq("recipe")
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to be_a(Hash)

      attributes = recipe[:attributes]

      expect(attributes).to have_key(:title)
      expect(attributes[:title]).to be_a(String)
      expect(attributes).to have_key(:url)
      expect(attributes[:url]).to be_a(String)
      expect(attributes).to have_key(:country)
      expect(attributes[:country]).to be_a(String)
      expect(attributes).to have_key(:image)
      expect(attributes[:image]).to be_a(String)
    end

    it "should not have unecessary data" do
      get "/api/v1/recipes", params: {country: "Deutschland"}

      expect(response.status).to eq(200)
      
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data].first[:attributes].keys).to eq([:title, :url, :country, :image])
      expect(parsed_response[:data].first[:attributes].keys).to_not include(:calories, :totalNutrients, :totalDaily)
    end

    it "returns an empty array if no recipes are found for country", :vcr do
      get "/api/v1/recipes", params: {country: "abcdefghijk"}
      # binding.pry
      expect(response.status).to eq(404)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data]).to eq([])
    end
  end
end