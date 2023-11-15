class Api::V1::LearningResourcesController < ApplicationController
  def show
    country = params[:country] ||  CountriesFacade.random_country
    if country
      learning_resource = LearningResourceFacade.fetch_learning_resource(country)
      # binding.pry
      render json: LearningResourceSerializer.new(learning_resource)
    else
      render json: { error: 'No country found' }, status: :not_found
    end
  end
end