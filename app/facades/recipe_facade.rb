class RecipeFacade

  def self.get_recipes_by_country(country)
    country = RestCountriesService.new.random_country if country.blank?
    response = EdamamService.new.get_recipes_by_country(country)
    response_body = JSON.parse(response.body, symbolize_names: true)
    if response_body[:hits].any?
      response_body[:hits].map do |recipe_data|
        Recipe.new(recipe_data, country)
      end
    else
      []
    end
  end
end