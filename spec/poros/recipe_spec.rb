require "rails_helper"

RSpec.describe Recipe do
  describe "initialize" do
    it "exists with attributes" do
      recipe = Recipe.new({recipe: {label: "Donner Kebab", url: "www.test.com", image: "Deutsch.png"}}, "Deutschland")

      expect(recipe).to be_a(Recipe)

      expect(recipe.title).to eq("Donner Kebab")
      expect(recipe.url).to eq("www.test.com")
      expect(recipe.country).to eq("Deutschland")
      expect(recipe.image).to eq("Deutsch.png")
    end
  end
end