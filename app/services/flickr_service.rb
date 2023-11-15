class FlickrService
  def conn
    Faraday.new(url: "https://api.flickr.com/services/rest") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.flickr[:key]
      # faraday.params["secret"] = Rails.application.credentials.flickr[:secret]
    end
  end

  def fetch_images(country)
    response = conn.get do |req|
      req.params["query"] = country
      req.params["method"] = "flickr.photos.search"
      req.params["media"] = "photos"
      req.params["format"] = "json"
      req.params["per_page"] = 10 # Requirement "up to 10 images for that country search"
    end
  end
end