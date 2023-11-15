require "rails_helper"

RSpec.describe LearningResourceFacade, :vcr do
  let (:facade) { LearningResourceFacade }

  describe "#fetch_learning_resource" do
    it "returns a learning resource object" do
      country = "Deutschland"
      response = facade.fetch_learning_resource(country)
      # binding.pry
      
      expect(response).to be_a(LearningResource)
    end
  end
end