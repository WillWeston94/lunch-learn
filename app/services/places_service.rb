class PlacesService
  def conn
    Faraday.new(url: "https://api.geoapify.com/v2/places") do |faraday|
      faraday.headers["Content-Type"] = "application/json"
      faraday.params["apiKey"] = Rails.application.credentials.geoapify[:api_key]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_tourist_sites(lon, lat)
    # binding.pry
    params = {
      categories: "tourism.sights",
      filter: "circle:#{lon},#{lat},1000",
      bias: "proximity:#{lon},#{lat}",
      limit: 10
    }
    
    response = conn.get("", params)

      if 
        response.status == 200
          parsed_response = JSON.parse(response.body, symbolize_names: true)
          # binding.pry
      else
        nil
      end
  end
end