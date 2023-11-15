class Api::V1::FavoritesController < ApplicationController
  def create
    request_body = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(api_key: request_body[:api_key])
    if user
      favorite = user.favorites.create!(country: request_body[:country], recipe_link: request_body[:recipe_link], recipe_title: request_body[:recipe_title])
      render json: {success: "Favorite added successfully"}, status: 201 # :created
    else
      render json: { error: "Invalid API credentials" }, status: 401 # :unauthorized
    end
  end
end

# https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#4xx_Client_errors