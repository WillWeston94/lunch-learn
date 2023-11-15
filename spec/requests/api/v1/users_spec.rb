require "rails_helper"

RSpec.describe "Users POST endpoint" do
  it "can create a new user" do
    user_params = {
      name: "Odell",
      email: "goodboy@ruffruff.com",
      password: "treats4lyf",
      password_confirmation: "treats4lyf"
    }

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
end