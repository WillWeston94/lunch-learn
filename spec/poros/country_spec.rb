require "rails_helper"

RSpec.describe Country, :vcr do
  describe "initialize" do
    it "exists with attributes" do
      country_data = 
      {
        :name=> 
        {
          :common=>"Germany",
          :official=>"Federal Republic of Germany"
        }
      }
    end
  end
end