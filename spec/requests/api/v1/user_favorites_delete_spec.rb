require "rails_helper"

RSpec.describe "User Favorites Delete action endpoint" do
  describe "when a user exists" do
    it "can delete a favorite and return a successful response with favorite data" do
      user = User.create!(name: "Basil", email: "BasilofBakerStreet", password: "elementary", password_confirmation: "elementary")
      favorite = user.favorites.create!(country: "Deutschland", recipe_link: "https://www.tastingtable.com/", recipe_title: "German Chocolate Cake")

      expect(user.favorites.count).to eq(1)
      # binding.pry
      request_body =
      {
        "api_key": "#{user.api_key}",
        "recipe_link": "https://www.tastingtable.com/"
      }

      delete "/api/v1/favorites", params: request_body, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(user.favorites.count).to eq(0)
      expect(Favorite.count).to eq(0)
      # binding.pry
    end
  end
end