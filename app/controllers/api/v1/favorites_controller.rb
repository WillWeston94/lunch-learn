class Api::V1::FavoritesController < ApplicationController

  def index
    api_key = params[:api_key]
    user = User.find_by(api_key: api_key)
    if user
      favorites = user.favorites
      # binding.pry
      render json: FavoriteSerializer.new(favorites), status: 200 # :OK
    else
      render json: { error: "Invalid API credentials" }, status: 401 # :unauthorized
    end
  end

  def create
    request_body = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(api_key: request_body[:api_key])
    if user
      # binding.pry
      favorite = user.favorites.create!(country: request_body[:country], recipe_link: request_body[:recipe_link], recipe_title: request_body[:recipe_title])
      render json: {success: "Favorite added successfully"}, status: 201 # :created
    else
      render json: { error: "Invalid API credentials" }, status: 401 # :unauthorized
    end
  end

  def destroy
    request_body = JSON.parse(request.body.read, symbolize_names: true)
    user = User.find_by(api_key: request_body[:api_key])
    if user
      favorite = user.favorites.find_by(request_body[:id])
      if favorite
        favorite.destroy
        render json: {success: "Favorite deleted successfully"}, status: 204 # :no_content
      else
        render json: { error: "Favorite not found" }, status: 404 # :not_found
      end
    else
      render json: { error: "Invalid API credentials" }, status: 401 # :unauthorized
    end
  end
end

# https://en.wikipedia.org/wiki/List_of_HTTP_status_codes#4xx_Client_errors