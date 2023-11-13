class EdamamService

  def conn
    Faraday.new(url: "https://api.edamam.com") do |faraday|
      faraday.headers["Content-Type"] = "application/json"
      faraday.params["app_id"] = Rails.application.credentials.edamam[:app_id]
      faraday.params["app_key"] = Rails.application.credentials.edamam[:app_key]
      faraday.params["type"] = "public"
    end
  end

  def get_recipes_by_country(country)
    response = conn.get("/api/recipes/v2") do |req|
      req.params["q"] = country
    end
  end
end