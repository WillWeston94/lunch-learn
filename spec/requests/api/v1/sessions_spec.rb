require "rails_helper"

RSpec.describe "Sessions POST endpoint" do
  describe "when a user exists" do
    it "can log in and return a successful response with user data" do
      user = User.create!(name: "Basil", email: "BasilofBakerStreet", password: "elementary", password_confirmation: "elementary")
      credentials = 
      {
        email: "BasilofBakerStreet",
        password: "elementary",
        password_confirmation: "elementary"
      }

      post "/api/v1/sessions", params: credentials, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to be_successful
      expect(response.status).to eq(200)

    end
  end
end