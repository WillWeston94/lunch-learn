require "rails_helper"

RSpec.describe "LearningResources API" do
  describe "GET /api/v1/learning_resources", :vcr do
    it "returns a successful json response" do
      get "/api/v1/learning_resources", params: { country: "Deutschland" }

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it "returns a list of learning resources via video and images for a specific country" do
      get "/api/v1/learning_resources", params: { country: "Deutschland" }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to be_an(Hash)
      expect(parsed_response[:data]).to have_key(:id)
      expect(parsed_response[:data][:id]).to eq(nil)
      expect(parsed_response[:data]).to have_key(:type)
      expect(parsed_response[:data][:type]).to be_a(String)
      expect(parsed_response[:data][:type]).to eq("learning_resource")
      expect(parsed_response[:data]).to have_key(:attributes)
      expect(parsed_response[:data][:attributes]).to be_a(Hash)

      video = parsed_response[:data][:attributes][:video]

      expect(video).to be_a(Hash)
      expect(video).to have_key(:title)
      expect(video[:title]).to be_a(String)
      expect(video).to have_key(:youtube_video_id)
      expect(video[:youtube_video_id]).to be_a(String)

      images = parsed_response[:data][:attributes][:images]

      expect(images).to be_an(Array)
      expect(images.first).to be_a(Hash)
      expect(images.first).to have_key(:alt_tag)
      expect(images.first[:alt_tag]).to be_a(String)
      expect(images.first).to have_key(:image_url)
      expect(images.first[:image_url]).to be_a(String)

    end

    it "returns an empty array if no learning resources are found for the country" do
      get "/api/v1/learning_resources", params: { country: "Camorr" }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data][:attributes][:video]).to eq({})
      expect(response_body[:data][:attributes][:images]).to eq([])
    end
  end
end