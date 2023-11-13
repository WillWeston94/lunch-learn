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

  def capital_coordinates(country)
    response = conn.get("/v3.1/name/#{country}")

    if response.success?
      country_data = JSON.parse(response.body, symbolize_names: true).first
      capital_info = country_data.dig(:capitalInfo, :latlng)

      capital = country_data.dig(:capital).first

      if capital_info && capital_info.is_a?(Array)
        lat, lng = capital_info
        { capital: capital, lat: lat, lng: lng}
      else
        nil
      end
    end
  end
end