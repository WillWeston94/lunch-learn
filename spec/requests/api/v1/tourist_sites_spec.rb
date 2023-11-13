require "rails_helper"

RSpec.describe "Tourist Sites API", type: :request do
  describe "GET /api/v1/tourist_sites" do
    let(:country) { "France" }
  end

  it "returns an array of tourist site objects for a specific capital" do
    get "/api/v1/tourist_sites", params: {country: country}

    expect(response.status).to eq(200)
    expect(json['data']).to be_an(Array)
  end
end