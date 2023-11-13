require "rails_helper"

RSpec.describe "Tourist Sites API" do
  describe "GET /api/v1/tourist_sites", :vcr do

  it "returns an array of tourist site objects for a specific capital" do
    get "/api/v1/tourist_sites?country=France"

    expect(response).to be_successful

      tourist_sites = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(tourist_sites).to be_an(Array)
      expect(tourist_sites.first).to have_key(:id)
      expect(tourist_sites.first[:id]).to eq(nil)
      expect(tourist_sites.first).to have_key(:type)
      expect(tourist_sites.first[:type]).to eq("tourist_site")
      expect(tourist_sites.first).to have_key(:attributes)
      expect(tourist_sites.first[:attributes]).to be_a(Hash)
      expect(tourist_sites.first[:attributes]).to have_key(:name)
      expect(tourist_sites.first[:attributes][:name]).to be_a(String)
      expect(tourist_sites.first[:attributes]).to have_key(:formatted)
      expect(tourist_sites.first[:attributes][:formatted]).to be_a(String)
    end
  end
end