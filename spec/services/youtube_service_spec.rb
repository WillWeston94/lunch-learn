require "rails_helper"

RSpec.describe YoutubeService, :vcr do
  let (:service) { YoutubeService.new }

  describe "#fetch_video" do
    it "returns a successful json response" do
      query = "Deutschland"
      response = service.fetch_video(query)
      response_body = JSON.parse(response.body, symbolize_names: true)
      # binding.pry

      expect(response.status).to eq(200)
      expect(response_body).to be_a(Hash)
    end
  end
end
