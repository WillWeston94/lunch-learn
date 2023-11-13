class Api::V1::RecipesController < ApplicationController
  def index
    country = params[:country]
    recipes = RecipeFacade.get_recipes_by_country(country)
    if recipes.any?
      render json: RecipeSerializer.new(recipes), status: 200
    else
      render json: { data: [] }, status: 404
    end
  end

  private

  def country
    @country = params[:country] || RestCountriesService.new.random_country.name
  end
end