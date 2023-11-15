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

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body).to be_a(Hash)
      expect(response_body).to have_key(:data)

      user_data = response_body[:data]

      expect(user_data).to be_a(Hash)
      expect(user_data).to have_key(:id)
      expect(user_data[:id]).to be_a(String)
      expect(user_data).to have_key(:type)
      expect(user_data[:type]).to eq("user")

      user_attributes = user_data[:attributes]
      # binding.pry
      expect(user_attributes).to have_key(:name)
      expect(user_attributes[:name]).to be_a(String)
      expect(user_attributes).to have_key(:email)
      expect(user_attributes[:email]).to be_a(String)
      expect(user_attributes).to have_key(:api_key)
      expect(user_attributes[:api_key]).to be_a(String)
    end
  end

  describe "when a user attempts to use an incorrect password" do
    it "returns an error message" do
      user = User.create!(name: "Basil", email: "BasilofBakerStreet", password: "elementary", password_confirmation: "elementary")

      credentials =
      {
        email: "BasilofBakerStreet",
        password: "dawson",
      }
      post "/api/v1/sessions", params: credentials, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Invalid email or password")
    end
  end

  describe "when a user attempts to use an incorrect email" do
    it "returns an error message" do
      user = User.create!(name: "Basil", email: "BasilofBakerStreet", password: "elementary", password_confirmation: "elementary")

      credentials =
      {
        email: "BasilofBaker",
        password: "elementary"
      }
      post "/api/v1/sessions", params: credentials, as: :json, headers: { "CONTENT_TYPE" => "application/json" }

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:error]).to eq("Invalid email or password")
    end
  end
end