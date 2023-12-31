class RestCountriesService
  def conn
    Faraday.new(url: "https://restcountries.com") do |faraday|
      faraday.headers["Content-Type"] = "application/json"
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def random_country
    countries = get_url("/v3.1/all")

    country = countries.sample
    # binding.pry
  end
end