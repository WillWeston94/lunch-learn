require "rails_helper"

RSpec.describe "Tourist Sites API", type: :request do
  describe "GET /api/v1/tourist_sites" do
    let(:country) { "France" }

  it "returns an array of tourist site objects for a specific capital" do
    get "/api/v1/tourist_sites?country=#{country}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    sites = JSON.parse(response.body, symbolize_names: true)

    expect(sites).to be_an(Array)
    sites.each do |site|
      expect(site).to include(
        id: nil,
        type: "tourist_site",
        attributes: {
          name: a_kind_of(String),
          formatted: a_kind_of(String),
          place_id: a_kind_of(String)
        }
      )
      end
    end
  end
end