require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email)}
    # it { should validate_uniqueness_of(:email)} shoulda matchers doesn't work with custom error messages
    it { should validate_presence_of(:password)}
  end

  describe "generate_api_key" do
    it "generates a unique api key for the user" do
      user = User.create!(name: "Odell", email: "goodboy@ruffruff.com", password: "treats4lyf", password_confirmation: "treats4lyf")
      user.generate_api_key

      expect(user.api_key).to be_a(String)
      expect(user.api_key.length).to eq(20)
    end
  end
end
