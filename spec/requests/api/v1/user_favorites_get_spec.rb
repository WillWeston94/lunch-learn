require "rails_helper"

RSpec.describe "User Favorites GET index action endpoint" do
  describe "when a user exists" do
    it "can return a successful response with user favorites" do
      user = User.create(name: "Basil", email: "BasilofBakerStreet", password: "elementary", password_confirmation: "elementary")
      favorite = user.favorites.create(country: "Deutschland", recipe_link: "https://www.tastingtable.com/", recipe_title: "German Chocolate Cake")

      expect(user.favorites.count).to eq(1)
      # binding.pry

      get "/api/v1/favorites/", params: { api_key: user.api_key }, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:data)
      expect(response_body[:data]).to be_an(Array)
      expect(response_body[:data].count).to eq(2)

      favorite_data = response_body[:data].first

      expect(favorite_data).to have_key(:id)
      expect(favorite_data[:id]).to be_a(String)
      expect(favorite_data).to have_key(:type)
      expect(favorite_data[:type]).to eq("favorite")

      favorite_attributes = favorite_data[:attributes]

      expect(favorite_attributes).to have_key(:country)
      expect(favorite_attributes[:country]).to be_a(String)
      expect(favorite_attributes).to have_key(:recipe_link)
      expect(favorite_attributes[:recipe_link]).to be_a(String)
      expect(favorite_attributes).to have_key(:recipe_title)
      expect(favorite_attributes[:recipe_title]).to be_a(String)

      favorite_2_data = response_body[:data].last

      expect(favorite_2_data).to have_key(:id)
      expect(favorite_2_data[:id]).to be_a(String)
      expect(favorite_2_data).to have_key(:type)
      expect(favorite_2_data[:type]).to eq("favorite")

      favorite_2_attributes = favorite_2_data[:attributes]

      expect(favorite_2_attributes).to have_key(:country)
      expect(favorite_2_attributes[:country]).to be_a(String)
      expect(favorite_2_attributes).to have_key(:recipe_link)
      expect(favorite_2_attributes[:recipe_link]).to be_a(String)
      expect(favorite_2_attributes).to have_key(:recipe_title)
      expect(favorite_2_attributes[:recipe_title]).to be_a(String)
    end
    
    it "can return a successful response with no favorites pointing towards an empty array" do
      user = User.create!(name: "Basil", email: "BasilofBakerStreet", password: "elementary", password_confirmation: "elementary")
      get "/api/v1/favorites", params: { api_key: user.api_key }, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:data)
      expect(response_body[:data]).to be_an(Array)
      expect(response_body[:data].count).to eq(0)
    end
  end
end