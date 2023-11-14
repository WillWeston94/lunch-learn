class YoutubeService
  def conn
    Faraday.new(url: "https://www.googleapis.com") do |faraday|
      faraday.params["key"] = Rails.application.credentials.youtube[:api_key]
      faraday.params["part"] = "snippet"
    end
  end

  def fetch_video(country) 
    response = conn.get("/youtube/v3/search") do |req|
      req.params["q"] = country
      req.params["type"] = "video"
      req.params["channelID"] = "UCluQ5yInbeAkkeCndNnUhpw"
    end
  end
end