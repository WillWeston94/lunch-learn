require "rails_helper"

RSpec.describe "Favorites POST endpoint" do
  describe "when a user exists" do
    it "can create a favorite and return a successful response with favorite data" do
      user = User.create!(name: "Basil", email: "BasilofBakerStreet", password: "elementary", password_confirmation: "elementary")
      expect(user.favorites.count).to eq(0)
      credentials =
      {
        email: "BasilofBakerStreet",
        password: "elementary",
        password_confirmation: "elementary"
      }
      request_body = 
      {
        "api_key": "#{user.api_key}",
        "country": "Deutschland",
        "recipe_link": "https://www.tastingtable.com/",
        "recipe_title": "German Chocolate Cake"
      }

      post "/api/v1/favorites", params: request_body, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to be_successful
      expect(response.status).to eq(201)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:success)
      expect(response_body[:success]).to eq("Favorite added successfully")
      expect(user.favorites.count).to eq(1)
      expect(Favorite.count).to eq(1) # Wanted to check model as we as user relationship above
    end
  end

  describe "when a user attempts to use an invalid api key" do
    it "returns an error message" do
      user = User.create!(name: "Basil", email: "BasilofBakerStreet", password: "elementary", password_confirmation: "elementary")
      expect(user.favorites.count).to eq(0)
      credentials =
      {
        email: "BasilofBakerStreet",
        password: "elementary",
        password_confirmation: "elementary"
      }
      request_body =
      {
        "api_key": "Pro. Ratigan",
        "country": "Deutschland",
        "recipe_link": "https://www.tastingtable.com/",
        "recipe_title": "German Chocolate Cake"
      }

      post "/api/v1/favorites", params: request_body, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:error)
      expect(response_body[:error]).to eq("Invalid API credentials")
      expect(user.favorites.count).to eq(0)
      expect(Favorite.count).to eq(0) 
    end
  end
end