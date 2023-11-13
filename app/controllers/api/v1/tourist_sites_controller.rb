class Api::V1::TouristSitesController < ApplicationController
  def index 
    country = params[:country]
    facade = TouristSitesFacade.new
    tourist_sites = facade.get_tourist_sites(country)
    if tourist_sites.any?

      render json: TouristSiteSerializer.new(tourist_sites), status: 200
      # binding.pry
    else
      render json: { data: [] }, status: 404
    end
  end

  private

  def tourist_sites_params(tourist_sites)
    tourist_sites.map do |tourist_site|
      {
        id: nil,
        type: "tourist_site",
        attributes: {
          name: tourist_site[:name],
          address: tourist_site[:formatted],
          place_id: tourist_site[:place_id]
      }
    }
    end
  end
end