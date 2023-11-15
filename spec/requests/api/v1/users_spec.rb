require "rails_helper"

RSpec.describe "Users POST endpoint" do
  let(:user) do
    { 
    user: 
     {
      name: "Odell",
      email: "goodboy@ruffruff.com",
      password: "treats4lyf",
      password_confirmation: "treats4lyf"
      }
    }
  end
    let(:basil_with_mismatched_password) do
      { 
      user_2: 
       {
        name: "Basil",
        email: "BasilofBakerStreet@Disney.com",
        password: "elementary",
        password_confirmation: "Dawson"
        }
      }
    end

  it "can create a new user" do
    post "/api/v1/users", params: user, as: :json # per requirements for body

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a(Hash)
    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to eq("user")

    user_attributes = user[:data][:attributes]
  
    expect(user_attributes).to have_key(:name)
    expect(user_attributes[:name]).to be_a(String)
    expect(user_attributes).to have_key(:email)
    expect(user_attributes[:email]).to be_a(String)
    expect(user_attributes).to have_key(:api_key)
    expect(user_attributes[:api_key]).to be_a(String)
    expect(user_attributes[:api_key].length).to eq(20)
  end

  describe "when email is already taken" do
    it "does not create a new user and returns error message about email being taken" do
      post "/api/v1/users", params: user, as: :json
      post "/api/v1/users", params: user, as: :json

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body)

      expect(response_body["error"]).to eq("Email has already been taken. Please try a different email.")
    end
  end

  describe "when passwords do not match" do
    it "does not create a new user and returns error message about passwords not matching" do
      post "/api/v1/users", params: basil_with_mismatched_password, as: :json
      
      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      response_body = JSON.parse(response.body)

      expect(response_body["error"]).to eq("Passwords do not match. Please try again.")
      end
    end
end