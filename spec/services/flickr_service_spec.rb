require "rails_helper"

RSpec.describe FlickrService, :vcr do
  let (:service) { FlickrService.new }

  describe "#fetch_images" do
    it "returns a successful json response" do
      query = "Deutschland"
      response = service.fetch_images(query)
      response_body = JSON.parse(response.body, symbolize_names: true)
      # binding.pry

      expect(response.status).to eq(200)
      expect(response_body).to be_a(Hash)
    end
  end
end