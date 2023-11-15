require "rails_helper"

RSpec.describe LearningResource, :vcr do
  describe "initialize" do
    it "exists with attributes" do
      country = "Deutschland"
      youtube_data = {
        :kind=>"youtube#searchResult",
        :etag=>"BWhpXS5N66Qr4uC4kBP2oZaNsdU",
        :id=>{:kind=>"youtube#video", :videoId=>"fEvBT95qfJE"},
        :snippet=>{
          :publishedAt=>"2022-10-13T22:52:32Z",
          :channelId=>"UCluQ5yInbeAkkeCndNnUhpw",
          :title=>"A Super Quick History of Palau"
        }
      } 
      flickr_data = [{
        :id=>"53333369404",
        :owner=>"199547091@N04",
        :secret=> "451500a436",
        :server=>"65535",
        :farm=>66,
        :title=>"Germany",
        :ispublic=>1,
        :isfriend=>0,
        :isfamily=>0
      }]
      
      learning_resource = LearningResource.new(youtube_data, flickr_data, country)

      expect(learning_resource).to be_a(LearningResource)
    end
  end
end